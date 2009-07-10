class StockAuditsController < ApplicationController
  around_filter :shopify_session
  layout "warehouse"
  
  def index
    @audits = StockAudit.find(:all)
  end
  
  def new
    @audit = StockAudit.new
    @audit.stock_audit_items.build
    @products = {}
    @variants = {}
    all_products = ShopifyAPI::Product.find(:all, :sort => :title)
    @vendors = all_products.map{|product| product.vendor}.uniq.sort{|a,b| a.casecmp(b)}
    @vendors.each do |vendor|
      @products[vendor] = all_products.select{|p| p.vendor == vendor}
    end
    all_products.each do |product|
      @variants[product] = product.variants.sort{|a,b| a.title.casecmp(b.title)}
    end
    orders = ShopifyAPI::Order.find(:all, :conditions => 'financial_status = pending')
  end
  
  def create
    @audit = StockAudit.new(params[:stock_audit])
    if @audit.save
      flash[:notice] = "Successfully created audit."
      redirect_to @audit
    else
      self.new
      render :action => 'new'
    end
  end
  
  def show
    @audit = StockAudit.find(params[:id])
  end
  
  def update
    
  end
  
  #def destroy
  #  
  #end
  
  #def edit
  #  
  #end
end
