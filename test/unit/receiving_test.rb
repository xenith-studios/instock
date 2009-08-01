require 'test_helper'

class ReceivingTest < ActiveSupport::TestCase
  context "A Receiving" do
    setup do
      @receiving = Receiving.new()
    end #setup
    
    should "require :shopify_store_id and :created_by" do
      assert_not_valid(@receiving)
      @receiving.shopify_store_id = 123654
      @receiving.created_by = "Bob"
      assert_valid(@receiving)
    end
  end #context
end
