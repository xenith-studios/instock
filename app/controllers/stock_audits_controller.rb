class StockAuditsController < ApplicationController
  around_filter :shopify_session
  layout "warehouse"
  
  def index
    @audits = StockAudit.find(:all)
  end
  
  def new
    @products = {}
    @all_products = ShopifyAPI::Product.find(:all, :sort => :title)
    @vendors = @all_products.map{|product| product.vendor}.uniq.sort{|a,b| a.casecmp(b)}
    @vendors.each do |vendor|
      @products[vendor] = @all_products.select{|p| p.vendor == vendor}
    end
    orders = ShopifyAPI::Order.find(:all, :conditions => 'financial_status = pending')
  end
  
  def create
    
  end
  
  def show
    
  end
end
