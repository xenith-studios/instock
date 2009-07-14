class ShipmentItem < ActiveRecord::Base
  belongs_to :shipment
  
  # Validations
  validates_presence_of(:count, :message => "'Stock Recieved' cannot be blank.")
  #validates_presence_of(:count)
  
  # Filters
  after_create do |si|
    vid = si.variant_id
    pid = si.product_id
    variant = ShopifyAPI::Variant.find(vid, :params => { :product_id => pid })
    variant.inventory_quantity += si.count
    unless(variant.save)
      si.errors.add_to_base("Could not update the shoppify store!")
    end
  end
  
  
  
end
