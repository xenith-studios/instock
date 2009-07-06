class WarehouseController < ApplicationController
  around_filter :shopify_session
  protect_from_forgery :except => :vendor_products
  
  def receive_shipment
    @vendor_names = ShopifyAPI::Product.find(:all).map{|product| product.vendor}.uniq
  end
  
  def process_shipment
    if(request.post?)
      variant_ids = params['variant_ids']
      raise(variant_ids.inspect)
    end #if
  end
  
  def vendor_products
    if(request.post?)
      vendor_name = params['vendor_name']
      @products = ShopifyAPI::Product.find(:all, :params => {:vendor => vendor_name})
      render(:layout => false)
    end #if
  end
end
