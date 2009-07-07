class Shipment < ActiveRecord::Base
  has_many :shipment_items
end
