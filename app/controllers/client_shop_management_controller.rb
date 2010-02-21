class ClientShopManagementController < ApplicationController
  around_filter :shopify_session
  
  def record_shop
    #find the record to update
    client_shop = ClientShop.find_or_create_by_id(current_shop.shop.id)
    
    #find attributes that we care about
    attributes = current_shop.shop.attributes.delete_if do |attribute, value|
      !client_shop.has_attribute?(attribute)
    end
  
    #update those attributes
    client_shop.update_attributes(attributes)
    
    #finish shop login
    flash[:notice] = "Logged in to shopify store."
    return_address = session[:return_to] || '/home'
    session[:return_to] = nil
    redirect_to return_address
  end
  
  
end
