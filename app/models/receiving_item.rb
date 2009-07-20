class ReceivingItem < ActiveRecord::Base
  belongs_to :receiving
  
  # Validations
  validates_presence_of(:count, :message => "'Stock Recieved' cannot be blank.")
  def validate
    unless(count.blank?) #this should be caught by validates_presence_of
      errors.add_to_base("Count can't be negative.") if(count <= 0)
    end
  end #validate
  
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
