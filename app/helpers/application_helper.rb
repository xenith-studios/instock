# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def nav(link_hash)
    links = Array.new
    link_hash.each do |key, value|
      links << link_to_unless_current(key, value)
    end
    links.reverse.join('<em> | </em>')
  end

  def current_shop
    if session[:shopify]
      ShopifyAPI::Shop.current
    end
  end
end
