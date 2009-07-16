class Shipment < ActiveRecord::Base
  has_many :shipment_items
  accepts_nested_attributes_for  :shipment_items
  
  # Validations
  validates_presence_of(:created_by, :message => "'Staff Member' can't be blank.")
  validates_presence_of(:shopify_store_id)
end
