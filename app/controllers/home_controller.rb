class HomeController < ApplicationController
  layout "application"
  around_filter :shopify_session, :except => 'welcome'
    
  def index
  end
  
  def design
  end
  
end