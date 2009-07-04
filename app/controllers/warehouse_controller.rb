class WarehouseController < ApplicationController
  around_filter :shopify_session
  protect_from_forgery :except => :vendor_products
  
  def receive_shipment
    @vendor_names = ShopifyAPI::Product.find(:all).map{|product| product.vendor}.uniq
  end
  
  def process_shipment
  end
  
  def vendor_products
    #if(request.post?)
      vendor_name = params['vendor_name']
      @products = ShopifyAPI::Product.find(:all, :params => {:vendor => vendor_name})
      render(:layout => false)
    #end #if
  end

  def stock_audit
    @vendors = ShopifyAPI::Product.find(:all, :group => :vendor, :order => 'vendor').map{|product| product.vendor}.uniq
    @products = ShopifyAPI::Product.find(:all, :sort => :title)#, :group => :vendor, :order => 'vendor')
    orders = ShopifyAPI::Order.find(:all, :limit => 'financial_status = pending')
  end
end
