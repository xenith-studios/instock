class StockAuditItem < ActiveRecord::Base
  belongs_to :stock_audit
  
  validates_presence_of :product_id, :variant_id, :title, :sku, :expected_count, :actual_count
end
