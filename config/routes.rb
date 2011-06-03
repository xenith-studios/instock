Instock::Application.routes.draw do
  root :to                   => 'home#index'

  match 'contact'            => 'home#contact'
  match 'about'              => 'home#about'
  match 'preferences'        => 'home#preferences'
  match 'support'            => 'home#support'

  match 'welcome'            => 'home#welcome'
  match 'design'             => 'home#design'

  match 'login'              => 'login#index'
  match 'login/authenticate' => 'login#authenticate'
  match 'login/finalize'     => 'login#finalize'
  match 'login/logout'       => 'login#logout'

  resources :stock_audits, :as => "audits" do |audits|
    resources :stock_audit_items, :only => :none
  end

  resources :receivings do |receivings|
    resources :receiving_items, :only => :none
  end

  resources :stock_adjustments, :as => "adjustments" do |adjustments|
    resources :stock_adjustment_items, :only => :none
  end

  resources :client_shops

  #Admin
  #map.admin_logout "admin_logout", :controller => "admin_sessions", :action => "destroy"
  #Resources
  #map.resource :account, :controller => "admins"
  #map.resources :admins 
  #map.resource :admin_session
    #map.root :controller => "admin_session_sessions", :action => "new"
end
