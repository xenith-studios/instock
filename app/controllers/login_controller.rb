class LoginController < ApplicationController
  def index
    # Ask user for their #{shop}.myshopify.com address
  end

  def authenticate
    ShopifyAPI::Session.setup({:api_key => "9b8ca7d587384d00267255bfd98cfe65", :secret => "4bb0add4f84f4a0181ed0e6d9ca048c5"})
    redirect_to ShopifyAPI::Session.new(params[:shop].chomp('/')).create_permission_url
  end

  # Shopify redirects the logged-in user back to this action along with
  # the authorization token t.
  #
  # This token is later combined with the developer's shared secret to form
  # the password used to call API methods.
  def finalize
    shopify_session = ShopifyAPI::Session.new(params[:shop], params[:t], params)
    if shopify_session.valid?
      session[:shopify] = shopify_session
      ActiveResource::Base.site = shopify_session.site

      redirect_to :controller => 'client_shop_management', :action => 'record_shop'

    else
      flash[:error] = "Could not log in to Shopify store."
      redirect_to :action => 'index'
    end
  end

  def logout
    session[:shopify] = nil
    flash[:notice] = "Successfully logged out."

    redirect_to :action => 'index'
  end
end
