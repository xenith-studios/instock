class WarehouseController < ApplicationController
  around_filter :shopify_session
  
  def receive_shipment
  end

  def stock_audit
    @vendors = ShopifyAPI::Product.find(:all, :group => :vendor, :order => 'vendor').map{|product| product.vendor}.uniq
    @products = ShopifyAPI::Product.find(:all, :sort => :title)#, :group => :vendor, :order => 'vendor')
    orders = ShopifyAPI::Order.find(:all, :limit => 'financial_status = pending')
  end
end
