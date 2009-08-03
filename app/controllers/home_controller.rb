class HomeController < ApplicationController
  layout "application"
  around_filter :shopify_session, :except => [:about, :contact, :support]
  
  def index
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