require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe StockAuditsController do

  def mock_stock_audit(stubs={})
    @mock_stock_audit ||= mock_model(StockAudit, stubs)
  end

  describe "GET index" do
    it "assigns all stock_audits as @audits" do
      StockAudit.stub!(:find).with(:all).and_return([mock_stock_audit])
      get :index
      assigns[:audits].should == [mock_stock_audit]
    end
  end

  describe "GET show" do
    it "assigns the requested stock_audit as @audit" do
      StockAudit.stub!(:find).with("37").and_return(mock_stock_audit)
      get :show, :id => "37"
      assigns[:audit].should equal(mock_stock_audit)
    end
  end

  describe "GET new" do
    it "assigns a new stock_audit as @audit" do
      StockAudit.stub!(:new).and_return(mock_stock_audit)
      get :new
      assigns[:audit].should equal(mock_stock_audit)
    end
  end

  describe "GET edit" do
    it "assigns the requested stock_audit as @audit" do
      StockAudit.stub!(:find).with("37").and_return(mock_stock_audit)
      get :edit, :id => "37"
      assigns[:audit].should equal(mock_stock_audit)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created stock_audit as @audit" do
        StockAudit.stub!(:new).with({'these' => 'params'}).and_return(mock_stock_audit(:save => true))
        post :create, :stock_audit => {:these => 'params'}
        assigns[:audit].should equal(mock_stock_audit)
      end

      it "redirects to the created stock_audit" do
        StockAudit.stub!(:new).and_return(mock_stock_audit(:save => true))
        post :create, :stock_audit => {}
        response.should redirect_to(stock_audit_url(mock_stock_audit))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved stock_audit as @audit" do
        StockAudit.stub!(:new).with({'these' => 'params'}).and_return(mock_stock_audit(:save => false))
        post :create, :stock_audit => {:these => 'params'}
        assigns[:audit].should equal(mock_stock_audit)
      end

      it "re-renders the 'new' template" do
        StockAudit.stub!(:new).and_return(mock_stock_audit(:save => false))
        post :create, :stock_audit => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested stock_audit" do
        StockAudit.should_receive(:find).with("37").and_return(mock_stock_audit)
        mock_stock_audit.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :stock_audit => {:these => 'params'}
      end

      it "assigns the requested stock_audit as @stock_audit" do
        StockAudit.stub!(:find).and_return(mock_stock_audit(:update_attributes => true))
        put :update, :id => "1"
        assigns[:stock_audit].should equal(mock_stock_audit)
      end

      it "redirects to the stock_audit" do
        StockAudit.stub!(:find).and_return(mock_stock_audit(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(stock_audit_url(mock_stock_audit))
      end
    end

    describe "with invalid params" do
      it "updates the requested stock_audit" do
        StockAudit.should_receive(:find).with("37").and_return(mock_stock_audit)
        mock_stock_audit.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :stock_audit => {:these => 'params'}
      end

      it "assigns the stock_audit as @stock_audit" do
        StockAudit.stub!(:find).and_return(mock_stock_audit(:update_attributes => false))
        put :update, :id => "1"
        assigns[:stock_audit].should equal(mock_stock_audit)
      end

      it "re-renders the 'edit' template" do
        StockAudit.stub!(:find).and_return(mock_stock_audit(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested stock_audit" do
      StockAudit.should_receive(:find).with("37").and_return(mock_stock_audit)
      mock_stock_audit.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the stock_audits list" do
      StockAudit.stub!(:find).and_return(mock_stock_audit(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(stock_audits_url)
    end
  end

end
