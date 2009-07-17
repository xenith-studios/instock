ActionController::Routing::Routes.draw do |map|
  map.root :controller => 'home'

  map.resources :stock_audits, :has_many => :stock_audit_items
  map.resources :shipments, :has_many => :shipment_items

  map.connect 'login/:action/:id', :controller => 'login'
  map.connect 'warehouse/:action/:id', :controller => 'warehouse'
  map.connect 'warehouse/:action/:id.:format', :controller => 'warehouse'

  # See how all your routes lay out with "rake routes"
  #map.connect ':controller/:action/:id'
  #map.connect ':controller/:action/:id.:format'
end
