require 'test_helper'

class ShipmentTest < ActiveSupport::TestCase
  context "A Shipment" do
    setup do
      @shipment = Shipment.new()
    end #setup
    
    should_validate_presence_of(:created_by, :shopify_store_id)
    
  end #context
end
