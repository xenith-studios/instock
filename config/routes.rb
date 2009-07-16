ActionController::Routing::Routes.draw do |map|
  map.root :controller => 'home'
  map.connect 'login/:action', :controller => 'login'
  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products
  map.resources :stock_audits, :has_many => :stock_audit_items
  map.resources :shipments, :has_many => :shipment_items

  # See how all your routes lay out with "rake routes"
end
