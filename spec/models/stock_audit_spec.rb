require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe StockAudit do
  before(:each) do
    @valid_attributes = {
      :created_by => "Bob Dole"
    }
  end

  it "should create a new instance given valid attributes" do
    StockAudit.create!(@valid_attributes)
  end
end
