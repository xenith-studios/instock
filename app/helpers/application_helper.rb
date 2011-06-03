module ApplicationHelper
  def current_shop
    if session[:shopify]
      return ShopifyAPI::Shop.current
    end
  end
end
