class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery

  helper_method :current_admin_session, :current_admin
  
  private
    def current_admin_session
      return @current_admin_session if defined?(@current_admin_session)
      @current_admin_session = AdminSession.find
    end

    def current_admin
      return @current_admin if defined?(@current_admin)
      @current_admin = current_admin_session && current_admin_session.admin
    end
    
    def require_admin
      unless current_admin
        store_location
        flash[:notice] = "You must be logged in to access this page"
        redirect_to new_admin_session_url
        return false
      end
    end
    
    def require_no_admin  
      if current_admin
        store_location
        flash[:notice] = "You must be logged out to access this page"
        redirect_to account_url
        return false
      end
    end

    def store_location
      session[:return_to] = request.request_uri
    end

    def redirect_back_or_default(default)
      redirect_to(session[:return_to] || default)
      session[:return_to] = nil
    end

#    def current_shop
#      ShopifyAPI::Shop.current
#    end

#    def shopify_session
#      ShopifyAPI::Session.setup({:api_key => "9b8ca7d587384d00267255bfd98cfe65", :secret => "4bb0add4f84f4a0181ed0e6d9ca048c5"})
#      unless session[:shopify]
#        redirect_to(:controller => 'login')
#      end
#      yield
#    end
end
