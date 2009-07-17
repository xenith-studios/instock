require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/stock_audits/new.html.erb" do
  include StockAuditsHelper

  before(:each) do
    assigns[:stock_audit] = stub_model(StockAudit,
      :new_record? => true
    )
  end

  it "renders new stock_audit form" do
    render

    response.should have_tag("form[action=?][method=post]", stock_audits_path) do
    end
  end
end
