ActionController::Routing::Routes.draw do |map|
  map.resources :client_shops

  
  map.root :controller => 'home'
  
  map.contact 'contact', :controller => :home, :action => "contact"
  map.preferences 'preferences', :controller => :home, :action => "preferences"
  map.about 'about', :controller => :home, :action => "about"
  map.support 'support', :controller => :home, :action => "support"

  #Admin
  map.admin_logout "admin_logout", :controller => "admin_sessions", :action => "destroy"
  #Resources
  map.resource :account, :controller => "admins"
  map.resources :admins 
  map.resource :admin_session
    map.root :controller => "admin_session_sessions", :action => "new"
    
  map.resources :stock_audits, :as => "audits" do |audits|
    map.resources :stock_audit_items, :only => :none
  end
  
  map.resources :receivings do | receivings|
    map.resources :receiving_items, :only => :none
  end
  
  map.resources :stock_adjustments, :as => "adjustments" do |adjustments|
    map.resources :stock_adjustment_items, :only => :none
  end

  map.connect 'login/:action/:id', :controller => 'login'

  # See how all your routes lay out with "rake routes"
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
