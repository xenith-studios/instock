class StockAudit < ActiveRecord::Base
  has_many :stock_audit_item
end
