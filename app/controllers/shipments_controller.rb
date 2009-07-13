class ShipmentsController < ApplicationController
  def index
    @shipment = Shipment.find :all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @shipment }
    end
  end

  def show
    @shipmnet = Shipment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @shipmnet }
    end
  end

  def new
    @shipmnet = Shipment.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @shipmnet }
    end
  end

  def edit
    @shipmnet = Shipment.find(params[:id])
  end

  def create
    @shipmnet = Shipment.new(params[:shipmnet])

    respond_to do |format|
      if @shipmnet.save
        flash[:notice] = 'Shipment was successfully created.'
        format.html { redirect_to(@shipmnet) }
        format.xml  { render :xml => @shipmnet, :status => :created, :location => @shipmnet }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @shipmnet.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @shipmnet = Shipment.find(params[:id])

    respond_to do |format|
      if @shipmnet.update_attributes(params[:shipmnet])
        flash[:notice] = 'Shipment was successfully updated.'
        format.html { redirect_to(@shipmnet) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @shipmnet.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @shipmnet = Shipment.find(params[:id])
    @shipmnet.destroy

    respond_to do |format|
      format.html { redirect_to(admin_shipment_url) }
      format.xml  { head :ok }
    end
  end
end
