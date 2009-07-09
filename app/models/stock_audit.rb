class StockAudit < ActiveRecord::Base
  has_many :stock_audit_items
  accepts_nested_attributes_for :stock_audit_items
end
