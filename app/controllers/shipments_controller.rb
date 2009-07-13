class ShipmentsController < ApplicationController
  def index
    @shipment = Shipment.find :all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @shipment }
    end
  end

  def show
    @shipment = Shipment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @shipment }
    end
  end

  def new
    @shipment = Shipment.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @shipment }
    end
  end

  def edit
    @shipment = Shipment.find(params[:id])
  end

  def create
    @shipment = Shipment.new(params[:shipment])

    respond_to do |format|
      if @shipment.save
        flash[:notice] = 'Shipment was successfully created.'
        format.html { redirect_to(@shipment) }
        format.xml  { render :xml => @shipment, :status => :created, :location => @shipment }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @shipment.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @shipment = Shipment.find(params[:id])

    respond_to do |format|
      if @shipment.update_attributes(params[:shipment])
        flash[:notice] = 'Shipment was successfully updated.'
        format.html { redirect_to(@shipment) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @shipment.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @shipment = Shipment.find(params[:id])
    @.destroy

    respond_to do |format|
      format.html { redirect_to(admin_shipment_url) }
      format.xml  { head :ok }
    end
  end
end
