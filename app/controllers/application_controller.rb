class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery

  helper_method :current_admin_session, :current_admin

  rescue_from ActiveResource::ServerError do
    flash[:error] = "The Shopify service is temporarily unavailable. Please try again in a few minutes."
    redirect_back_or_default dashboard_url
  end

  rescue_from NoMethodError do
    flash[:error] = "Your session has become invalid. Please log in again."
    session[:shopify] = nil
    redirect_to login_url
  end

  rescue_from RuntimeError do
    flash[:error] = "Your session has become invalid. Please log in again."
    session[:shopify] = nil
    redirect_to login_url
  end

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
end
