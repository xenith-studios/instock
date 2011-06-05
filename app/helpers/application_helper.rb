module ApplicationHelper
  def current_shop
    if session[:shopify]
      begin
        return ShopifyAPI::Shop.current
      rescue
        return nil
      end
    end
  end
end
