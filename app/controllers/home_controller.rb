class HomeController < ApplicationController
  
  around_filter :shopify_session, :except => [:index, :about, :contact]
  
  def index
    if session[:shopify]
      redirect_to :action => :dashboard
    end
  end

  def about
  end
  
  def contact
  end
  
  def preferences
  end
  
  def dashboard
  end
end