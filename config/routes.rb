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
  map.resources :receivings, :has_many => :receiving_items

  # See how all your routes lay out with "rake routes"
  
  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via
  # consider removing the them or commenting them out if you're using named routes
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
