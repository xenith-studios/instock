class HomeController < ApplicationController
  layout "application"
  around_filter :shopify_session, :except => [:index, :about, :contact]
  
  def index
  end
  
  def about
  end
  
  def contact
  end
  
  def preferences
  end
end