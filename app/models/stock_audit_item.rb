class StockAuditItem < ActiveRecord::Base
  belongs_to :stock_audit
  
  attr_accessor :shopify_count, :pending_count
  validates_presence_of :product_id, :variant_id, :title, :sku, :expected_count, :product_title, :vendor
  validates_presence_of :actual_count, :message => "cannot be empty."
  
  after_create do |item|
    variant_id = item.variant_id
    product_id = item.product_id
    variant = ShopifyAPI::Variant.find(variant_id, :params => { :product_id => product_id })
    variant.inventory_quantity = item.actual_count
    unless variant.save
      item.errors.add_to_base("Could not update the shoppify store!")
    end
  end
end
