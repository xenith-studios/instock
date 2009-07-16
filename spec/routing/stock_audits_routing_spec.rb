require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe StockAuditsController do
  describe "route generation" do
    it "maps #index" do
      route_for(:controller => "stock_audits", :action => "index").should == "/stock_audits"
    end

    it "maps #new" do
      route_for(:controller => "stock_audits", :action => "new").should == "/stock_audits/new"
    end

    it "maps #show" do
      route_for(:controller => "stock_audits", :action => "show", :id => "1").should == "/stock_audits/1"
    end

    it "maps #edit" do
      route_for(:controller => "stock_audits", :action => "edit", :id => "1").should == "/stock_audits/1/edit"
    end

    it "maps #create" do
      route_for(:controller => "stock_audits", :action => "create").should == {:path => "/stock_audits", :method => :post}
    end

    it "maps #update" do
      route_for(:controller => "stock_audits", :action => "update", :id => "1").should == {:path =>"/stock_audits/1", :method => :put}
    end

    it "maps #destroy" do
      route_for(:controller => "stock_audits", :action => "destroy", :id => "1").should == {:path =>"/stock_audits/1", :method => :delete}
    end
  end

  describe "route recognition" do
    it "generates params for #index" do
      params_from(:get, "/stock_audits").should == {:controller => "stock_audits", :action => "index"}
    end

    it "generates params for #new" do
      params_from(:get, "/stock_audits/new").should == {:controller => "stock_audits", :action => "new"}
    end

    it "generates params for #create" do
      params_from(:post, "/stock_audits").should == {:controller => "stock_audits", :action => "create"}
    end

    it "generates params for #show" do
      params_from(:get, "/stock_audits/1").should == {:controller => "stock_audits", :action => "show", :id => "1"}
    end

    it "generates params for #edit" do
      params_from(:get, "/stock_audits/1/edit").should == {:controller => "stock_audits", :action => "edit", :id => "1"}
    end

    it "generates params for #update" do
      params_from(:put, "/stock_audits/1").should == {:controller => "stock_audits", :action => "update", :id => "1"}
    end

    it "generates params for #destroy" do
      params_from(:delete, "/stock_audits/1").should == {:controller => "stock_audits", :action => "destroy", :id => "1"}
    end
  end
end
