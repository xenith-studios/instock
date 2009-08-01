class StockAdjustment < ActiveRecord::Base
  has_many :stock_adjustment_items
  accepts_nested_attributes_for  :stock_adjustment_items
  
  # Validations
  validates_presence_of(:created_by, :message => "'Staff Member' can't be blank.")
  validates_presence_of(:shopify_store_id)
  validates_presence_of(:reason)
end
