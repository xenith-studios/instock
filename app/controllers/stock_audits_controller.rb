class StockAuditsController < ApplicationController
  around_filter :shopify_session
  protect_from_forgery
  layout "application"
  
  def index
    @audits = StockAudit.find :all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @audits }
    end
  end
  
  def new
    @audit = StockAudit.new
    @audit.stock_audit_items.build
    build_products_and_orders

    # Set up the needed hashes
    products = {}
    variants = {}
    fulfillments = {}
    
    # Gather the data from Shopify
    all_products = ShopifyAPI::Product.find(:all, :sort => :title)
    orders = ShopifyAPI::Order.find(:all, :params => { :status => "open", :fulfillment_status => "unshipped", :fulfillment_status => "partial"})
    
    # Build the hashes needed by the actions
    vendors = all_products.map{|product| product.vendor}.uniq.sort{|a,b| a.casecmp(b)}
    vendors.each do |vendor|
      products[vendor] = all_products.select{|p| p.vendor == vendor}
    end
    all_products.each do |product|
      variants[product] = product.variants.sort{|a,b| a.title.casecmp(b.title)}
    end
    orders.each do |order|
      fulfillments[order] = ShopifyAPI::Fulfillment.find(:all, :params => { :order_id => order.id } )
    end

    variants.each do |variant|
      item = StockAuditItem.new
      item.product_id = variant.product_id
      item.variant_id = variant.object_id
      item.title = variant.title
      item.sku = variant.sku
      item.shopify_count = variant.inventory_quantity
      item.pending_count = 0
      item.expected_count = item.shopify_count + item.pending_count
    end
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @audit }
    end
  end
  
  def create
    @audit = StockAudit.new(params[:stock_audit])

    respond_to do |format|
      if @audit.save
        flash[:notice] = 'Audit was successfully created.'
        format.html { redirect_to(@audit) }
        format.xml  { render :xml => @audit, :status => :created, :location => @audit }
      else
        build_products_and_orders
        format.html { render :action => "new" }
        format.xml  { render :xml => @audit.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def show
    @audit = StockAudit.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @audit }
    end
  end
  
  def edit
    @audit = StockAudit.find(params[:id])
  end
  
  def update
    @audit = StockAudit.find(params[:id])

    respond_to do |format|
      if @audit.update_attributes(params[:audit])
        flash[:notice] = 'StockAudit was successfully updated.'
        format.html { redirect_to(@audit) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @audit.errors, :status => :unprocessable_entity }
      end
    end
  end

#  def destroy
#    @audit = StockAudit.find(params[:id])
#    @audit.destroy

#    respond_to do |format|
#      format.html { redirect_to(admin_audits_url) }
#      format.xml  { head :ok }
#    end
#  end

private
  def build_products_and_orders
    # Set up the needed hashes
    @products = {}
    @variants = {}
    fulfillments = {}
    
    # Gather the data from Shopify
    all_products = ShopifyAPI::Product.find(:all, :sort => :title)
    @orders = ShopifyAPI::Order.find(:all, :params => { :status => "open", :fulfillment_status => "unshipped", :fulfillment_status => "partial"})
    
    # Build the hashes needed by the actions
    @vendors = all_products.map{|product| product.vendor}.uniq.sort{|a,b| a.casecmp(b)}
    @vendors.each do |vendor|
      @products[vendor] = all_products.select{|p| p.vendor == vendor}
    end
    all_products.each do |product|
      @variants[product] = product.variants.sort{|a,b| a.title.casecmp(b.title)}
    end
    @orders.each do |order|
      fulfillments[order] = ShopifyAPI::Fulfillment.find(:all, :params => { :order_id => order.id } )
    end
  end
end
