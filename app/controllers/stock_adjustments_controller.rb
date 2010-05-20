class StockAdjustmentsController < ApplicationController
  around_filter :shopify_session

  def index
    @stock_adjustments = StockAdjustment.find(:all, :conditions => ["shopify_store_id = ?", current_shop.shop.id])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @stock_adjustments }
    end
  end

  def show
    begin
    @stock_adjustment = StockAdjustment.find(params[:id], :conditions => ["shopify_store_id = ?", current_shop.shop.id])
    rescue ActiveRecord::RecordNotFound
      logger.error("Attempt to access a stock adjustment that doesnt exist (#{params[:id]}) for the current shop (#{current_shop.url}).")
      flash[:error] = "Could not find that stock adjustment!"
      redirect_to(:action => 'index')
    else
      respond_to do |format|
        format.html # show.html.erb
        format.xml  { render :xml => @stock_adjustment }
      end
    end #begin
  end

  def new
    @vendor_names = ShopifyAPI::Product.find(:all).map{|product| product.vendor}.uniq
    @stock_adjustment = StockAdjustment.new
    

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @stock_adjustment }
    end
  end

  
  #def edit
  #  @stock_adjustment = StockAdjustment.find(params[:id])
  #end

  def create
    @stock_adjustment = StockAdjustment.new(params[:stock_adjustment])
    @stock_adjustment.shopify_store_id = current_shop.shop.id

    respond_to do |format|
      if @stock_adjustment.save
        flash[:notice] = "Stock Adjustment was successfully created."
        format.html { redirect_to(@stock_adjustment) }
        format.xml  { render :xml => @stock_adjustment, :status => :created, :location => @stock_adjustment }
      else
        flash[:error] = "Could not save this Stock Adjustment. Please try again."
        format.html { render :action => "create" }
        format.xml  { render :xml => @stock_adjustment.errors, :status => :unprocessable_entity }
      end
    end
  end

  
  #def update
  #  @stock_adjustment = StockAdjustment.find(params[:id])
  #
  #  respond_to do |format|
  #    if @stock_adjustment.update_attributes(params[:stock_adjustment])
  #      flash[:notice] = 'StockAdjustment was successfully updated.'
  #      format.html { redirect_to(@stock_adjustment) }
  #      format.xml  { head :ok }
  #    else
  #      format.html { render :action => "edit" }
  #      format.xml  { render :xml => @stock_adjustment.errors, :status => :unprocessable_entity }
  #    end
  #  end
  #end

  def destroy
    @stock_adjustment = StockAdjustment.find(params[:id])
    @stock_adjustment.destroy

    respond_to do |format|
      format.html { redirect_to(stock_adjustments_url) }
      format.xml  { head :ok }
    end
  end
end
