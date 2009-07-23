ActionController::Routing::Routes.draw do |map|
  map.root :controller => 'home'

  map.resources :stock_audits, :has_many => :stock_audit_items
  map.resources :receivings, :has_many => :receiving_items

  map.connect 'login/:action/:id', :controller => 'login'

  # See how all your routes lay out with "rake routes"
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
