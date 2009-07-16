require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/stock_audits/index.html.erb" do
  include StockAuditsHelper

  before(:each) do
    assigns[:stock_audits] = [
      stub_model(StockAudit),
      stub_model(StockAudit)
    ]
  end

  it "renders a list of stock_audits" do
    render
  end
end
