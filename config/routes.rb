Instock::Application.routes.draw do
  root :to                   => 'home#index'

  match 'welcome'            => 'home#welcome'

  match 'design'             => 'home#design'

  match 'login'              => 'login#index'

  match 'login/authenticate' => 'login#authenticate'

  match 'login/finalize'     => 'login#finalize'

  match 'login/logout'       => 'login#logout'

  resources :stock_audits, :as => "audits" do |audits|
    resources :stock_audit_items, :only => :none
  end
  
  resources :receivings do | receivings|
    resources :receiving_items, :only => :none
  end
  
  resources :stock_adjustments, :as => "adjustments" do |adjustments|
    resources :stock_adjustment_items, :only => :none
  end
  
  resources :client_shops
end
