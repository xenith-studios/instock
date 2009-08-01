require 'test_helper'

class StockAdjustmentItemTest < ActiveSupport::TestCase
  context "A Stock Adjustment Item" do
    setup do
      @invalid = StockAdjustmentItem.new()
      @invalid.count = -20
    end
    should "not allow a negative :count" do
      assert_not_valid(@invalid)
    end
  end #context
end
