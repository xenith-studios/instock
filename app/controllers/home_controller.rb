class HomeController < ApplicationController
  
  around_filter :shopify_session, :except => [:index, :about, :contact]
  
  def index
  end

  def about
  end
  
  def contact
  end
  
  def preferences
  end
  
  def welcome
    current_host = "#{request.host}#{':' + request.port.to_s if request.port != 80}"
    @callback_url = "http://#{current_host}/login/finalize"
  end
end