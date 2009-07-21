class ReceivingsController < ApplicationController
  around_filter :shopify_session
  layout 'application'
  
  def index
    @receivings = Receiving.find :all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @receiving }
    end
  end

  def show
    @receiving = Receiving.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @receiving }
    end
  end

  def new
    product_variant_ids = params['product_variant_ids']
    if(product_variant_ids.blank?)
          flash[:notice] = "No products were selected for this receiving. Please select at least one product to receive."
          redirect_to(:action => 'receive_receiving',  :controller => 'warehouse')
    else
      @receiving = Receiving.new()
      @receiving.shopify_store_id = current_shop.id
      @variants = Hash.new()
      product_variant_ids.each do |pvid|
        pid, vid = pvid.split("|")
        product = ShopifyAPI::Product.find(pid)
        variant = ShopifyAPI::Variant.find(vid, :params => { :product_id => pid })
        title = variant.title =~ /Default/ ? product.title : product.title + "(" + variant.title + ")" 
        @receiving.receiving_items << ReceivingItem.new(
          :variant_id => vid, 
          :product_id => pid, 
          :title => title,
          :sku => variant.sku)
      end #each

      respond_to do |format|
        format.html # new.html.erb
        format.xml  { render :xml => @receiving }
      end
    end
    
    rescue ActiveResource::ResourceNotFound => e
      # Just ignore it ?!?
  end

  def edit
    @receiving = Receiving.find(params[:id])
  end

  def create
    @receiving = Receiving.new(params[:receiving])

    respond_to do |format|
      if @receiving.save
        flash[:notice] = 'Receiving was successfully created.'
        format.html { redirect_to(:action => 'index') }
        format.xml  { render :xml => @receiving, :status => :created, :location => @receiving }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @receiving.errors, :status => :unprocessable_entity }
      end
    end
    rescue ActiveResource::ResourceNotFound => e
      # Just ignore it ?!?
  end

  def update
    @receiving = Receiving.find(params[:id])

    respond_to do |format|
      if @receiving.update_attributes(params[:receiving])
        flash[:notice] = 'Receiving was successfully updated.'
        format.html { redirect_to(:action => 'index') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @receiving.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @receiving = Receiving.find(params[:id])
    @receiving.destroy

    respond_to do |format|
      flash[:notice] = "Receiving #{@receiving.created_at} was permanently deleted."
      format.html { redirect_to(:action => 'index') }
      format.xml  { head :ok }
    end
  end
end
