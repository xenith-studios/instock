class ReceivingsController < ApplicationController
  around_filter :shopify_session
  
  def index
    @receivings = Receiving.find(:all, :conditions => ["shopify_store_id = ?", current_shop.id])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @receiving }
    end
  end

  def show
    begin
    @receiving = Receiving.find(params[:id], :conditions => ["shopify_store_id = ?", current_shop.id])
    rescue ActiveRecord::RecordNotFound
      logger.error("Attempt to access a recieving that doesnt exist (#{params[:id]}) for the current shop (#{current_shop.domain}).")
      flash[:error] = "Could not find that receiving!"
      redirect_to(:action => 'index')
    else
      respond_to do |format|
        format.html # show.html.erb
        format.xml  { render :xml => @receiving }
      end
    end #begin   
  end

  def new
    @receiving = Receiving.new()
    @vendor_names = ShopifyAPI::Product.find(:all).map{|product| product.vendor}.uniq
  end

  #def edit
  #  @receiving = Receiving.find(params[:id])
  #end

  def create
    @receiving = Receiving.new(params[:receiving])
    @receiving.shopify_store_id = current_shop.id

    respond_to do |format|
      if @receiving.save
        flash[:notice] = 'Receiving was successfully created.'
        format.html { redirect_to(:action => 'index') }
        format.xml  { render :xml => @receiving, :status => :created, :location => @receiving }
      else
        flash[:notice] = 'Could not create Receiving. Fix the errors below and try again.'
        format.html { render :action => "create" }
        format.xml  { render :xml => @receiving.errors, :status => :unprocessable_entity }
      end
    end
    rescue ActiveResource::ResourceNotFound => e
      # Just ignore it ?!?
  end

  #def update
  #  @receiving = Receiving.find(params[:id])
  #
  #  respond_to do |format|
  #    if @receiving.update_attributes(params[:receiving])
  #      flash[:notice] = 'Receiving was successfully updated.'
  #      format.html { redirect_to(:action => 'index') }
  #      format.xml  { head :ok }
  #    else
  #      format.html { render :action => "edit" }
  #      format.xml  { render :xml => @receiving.errors, :status => :unprocessable_entity }
  #    end
  #  end
  #end

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
