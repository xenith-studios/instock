class HomeController < ApplicationController
  layout "application"
  around_filter :shopify_session
  
  def index
  end
  
  def design
  end
  
  def contact
  end
  
  def about
    
  end
  
  def support
    
  end
  
  def preferences
  end
end