class ShipmentsController < ApplicationController
  around_filter :shopify_session
  layout 'warehouse'
  
  def index
    @shipment = Shipment.find :all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @shipment }
    end
  end

  def show
    @shipment = Shipment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @shipment }
    end
  end

  def new
    product_variant_ids = params['product_variant_ids']
    @shipment = Shipment.new()
    @variants = Hash.new()
    product_variant_ids.each do |pvid|
      pid, vid = pvid.split("|")
      product = ShopifyAPI::Product.find(pid)
      variant = ShopifyAPI::Variant.find(vid, :params => { :product_id => pid })
      title = variant.title =~ /Default/ ? product.title : product.title + "(" + variant.title + ")"
      @variants[vid.to_i] = variant unless variant.blank? 
      @shipment.shipment_items << ShipmentItem.new(
        :variant_id => vid, 
        :product_id => pid, 
        :title => title,
        :sku => variant.sku)
    end #each

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @shipment }
    end
    
    rescue ActiveResource::ResourceNotFound => e
      # Just ignore it ?!?
  end

  def edit
    @shipment = Shipment.find(params[:id])
  end

  def create
    @shipment = Shipment.new(params[:shipment])

    respond_to do |format|
      if @shipment.save
        flash[:notice] = 'Shipment was successfully created.'
        format.html { redirect_to(@shipment) }
        format.xml  { render :xml => @shipment, :status => :created, :location => @shipment }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @shipment.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @shipment = Shipment.find(params[:id])

    respond_to do |format|
      if @shipment.update_attributes(params[:shipment])
        flash[:notice] = 'Shipment was successfully updated.'
        format.html { redirect_to(@shipment) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @shipment.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @shipment = Shipment.find(params[:id])
    @shipment.destroy

    respond_to do |format|
      format.html { redirect_to(admin_shipment_url) }
      format.xml  { head :ok }
    end
  end
end
