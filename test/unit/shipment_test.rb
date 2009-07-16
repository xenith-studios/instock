require 'test_helper'

class ShipmentTest < ActiveSupport::TestCase
  context "A Shipment" do
    setup do
      @shipment = Shipment.new()
    end #setup
    
    should "require :shopify_store_id and :created_by" do
      assert_invalid(@shipment)
      @shipment.shopify_store_id = 123654
      @shipment.created_by = "Bob"
      assert_valid(@shipment)
    end
    
  end #context
end
