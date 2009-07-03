class WarehouseController < ApplicationController
  around_filter :shopify_session
  
  def receive_shipment
    @products = ShopifyAPI::Product.find(:all, :order => 'vendor')
    @vendor_names = @products.map{|product| product.vendor}.uniq
    
  end
end
