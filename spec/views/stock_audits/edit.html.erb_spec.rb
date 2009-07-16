require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/stock_audits/edit.html.erb" do
  include StockAuditsHelper

  before(:each) do
    assigns[:stock_audit] = @stock_audit = stub_model(StockAudit,
      :new_record? => false
    )
  end

  it "renders the edit stock_audit form" do
    render

    response.should have_tag("form[action=#{stock_audit_path(@stock_audit)}][method=post]") do
    end
  end
end
