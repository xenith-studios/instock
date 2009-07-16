class WarehouseController < ApplicationController
  around_filter :shopify_session
  protect_from_forgery :except => :vendor_products
  layout "application"
  
  def receive_shipment
    @vendor_names = ShopifyAPI::Product.find(:all).map{|product| product.vendor}.uniq
  end
  
  def vendor_products
    if(request.post?)
      vendor_name = params['vendor_name']
      @products = ShopifyAPI::Product.find(:all, :params => {:vendor => vendor_name})
      render(:layout => false)
    end #if
  end
end
