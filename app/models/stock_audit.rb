class StockAudit < ActiveRecord::Base
  has_many :stock_audit_items
  accepts_nested_attributes_for :stock_audit_items
  
  validates_presence_of :created_by, :message => "cannot be empty."
  validates_presence_of :shopify_store_id
end
