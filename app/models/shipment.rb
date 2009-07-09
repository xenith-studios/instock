class Shipment < ActiveRecord::Base
  has_many :shipment_items
  accepts_nested_attributes_for  :shipment_items
end
