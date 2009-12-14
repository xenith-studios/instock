RAILS_DEFAULT_LOGGER.debug "message"class ClientShopsController < ApplicationController
  # GET /client_shops
  # GET /client_shops.xml
  def index
    @client_shops = ClientShop.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @client_shops }
    end
  end

  # GET /client_shops/1
  # GET /client_shops/1.xml
  def show
    @client_shop = ClientShop.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @client_shop }
    end
  end

  # GET /client_shops/new
  # GET /client_shops/new.xml
  def new
    @client_shop = ClientShop.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @client_shop }
    end
  end

  # GET /client_shops/1/edit
  def edit
    @client_shop = ClientShop.find(params[:id])
  end

  # POST /client_shops
  # POST /client_shops.xml
  def create
    @client_shop = ClientShop.new(params[:client_shop])

    respond_to do |format|
      if @client_shop.save
        flash[:notice] = 'ClientShop was successfully created.'
        format.html { redirect_to(@client_shop) }
        format.xml  { render :xml => @client_shop, :status => :created, :location => @client_shop }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @client_shop.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /client_shops/1
  # PUT /client_shops/1.xml
  def update
    @client_shop = ClientShop.find(params[:id])

    respond_to do |format|
      if @client_shop.update_attributes(params[:client_shop])
        flash[:notice] = 'ClientShop was successfully updated.'
        format.html { redirect_to(@client_shop) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @client_shop.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /client_shops/1
  # DELETE /client_shops/1.xml
  def destroy
    @client_shop = ClientShop.find(params[:id])
    @client_shop.destroy

    respond_to do |format|
      format.html { redirect_to(client_shops_url) }
      format.xml  { head :ok }
    end
  end
end
