require 'test_helper'

class ReceivingItemTest < ActiveSupport::TestCase
  context "A ReceivingItem" do
    setup do
      @invalid = ReceivingItem.new()
      @invalid.count = -20
    end
    should "not allow a negative :count" do
      assert_not_valid(@invalid)
    end
  end #context
end
