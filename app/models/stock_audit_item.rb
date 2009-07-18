class StockAuditItem < ActiveRecord::Base
  belongs_to :stock_audit
  
  attr_accessor :shopify_count, :pending_count, :vendor, :product_title
  validates_presence_of :product_id, :variant_id, :title, :sku, :expected_count, :actual_count
end
