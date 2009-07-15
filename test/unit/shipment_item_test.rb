require 'test_helper'

class ShipmentItemTest < ActiveSupport::TestCase
  context "A ShipmetItem" do
    setup do
      @invalid = ShipmentItem.new()
      @invalid.count = -20
    end
    should "not allow a negative :count" do
      assert_not_valid(@invalid)
    end
  end #context
end
