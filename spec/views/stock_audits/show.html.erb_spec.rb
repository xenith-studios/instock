require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/stock_audits/show.html.erb" do
  include StockAuditsHelper
  before(:each) do
    assigns[:stock_audit] = @stock_audit = stub_model(StockAudit)
  end

  it "renders attributes in <p>" do
    render
  end
end
