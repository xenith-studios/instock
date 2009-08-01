require 'test_helper'

class StockAdjustmentTest < ActiveSupport::TestCase
  context "A Stock Adjustment" do
    setup do
      @stock_adjustment = StockAdjustment.new()
    end #setup
    
    should "require :shopify_store_id, :created_by, and :reason" do
      assert_not_valid(@stock_adjustment)
      @stock_adjustment.shopify_store_id = 123654
      @stock_adjustment.created_by = "Bob"
      @stock_adjustment.reason = "Donation"
      assert_valid(@stock_adjustment)
    end
  end #context
end
