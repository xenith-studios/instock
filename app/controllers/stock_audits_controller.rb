class StockAuditsController < ApplicationController
  around_filter :shopify_session
  layout "application"
  
  def index
    @audits = StockAudit.find :all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @audits }
    end
  end
  
  def new
    @audit = StockAudit.new
    @audit.stock_audit_items.build
    @products = {}
    @variants = {}
    all_products = ShopifyAPI::Product.find(:all, :sort => :title)
    @vendors = all_products.map{|product| product.vendor}.uniq.sort{|a,b| a.casecmp(b)}
    @vendors.each do |vendor|
      @products[vendor] = all_products.select{|p| p.vendor == vendor}
    end
    all_products.each do |product|
      @variants[product] = product.variants.sort{|a,b| a.title.casecmp(b.title)}
    end
    orders = ShopifyAPI::Order.find(:all, :conditions => 'financial_status = pending')
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @audit }
    end
  end
  
  def create
    @audit = StockAudit.new(params[:audit])

    respond_to do |format|
      if @audit.save
        flash[:notice] = 'Audit was successfully created.'
        format.html { redirect_to(@audit) }
        format.xml  { render :xml => @audit, :status => :created, :location => @audit }
      else
        @products = {}
        @variants = {}
        all_products = ShopifyAPI::Product.find(:all, :sort => :title)
        @vendors = all_products.map{|product| product.vendor}.uniq.sort{|a,b| a.casecmp(b)}
        @vendors.each do |vendor|
          @products[vendor] = all_products.select{|p| p.vendor == vendor}
        end
        all_products.each do |product|
          @variants[product] = product.variants.sort{|a,b| a.title.casecmp(b.title)}
        end
        orders = ShopifyAPI::Order.find(:all, :conditions => 'financial_status = pending')
        format.html { render :action => "new" }
        format.xml  { render :xml => @audit.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def show
    @audit = StockAudit.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @audit }
    end
  end
  
  def edit
    @audit = StockAudit.find(params[:id])
  end
  
  def update
    @audit = StockAudit.find(params[:id])

    respond_to do |format|
      if @audit.update_attributes(params[:audit])
        flash[:notice] = 'StockAudit was successfully updated.'
        format.html { redirect_to(@audit) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @audit.errors, :status => :unprocessable_entity }
      end
    end
  end

#  def destroy
#    @audit = StockAudit.find(params[:id])
#    @audit.destroy

#    respond_to do |format|
#      format.html { redirect_to(admin_audits_url) }
#      format.xml  { head :ok }
#    end
#  end
end
