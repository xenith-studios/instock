class StockAdjustmentItem < ActiveRecord::Base
  belongs_to :stock_adjustment
  
  # Validations
  validates_presence_of(:count, :message => "'count' cannot be blank.")
  def validate
    unless(count.blank?) #this should be caught by validates_presence_of
      errors.add_to_base("Count can't be negative.") if(count <= 0)
    end
  end #validate
  
  # Filters
  after_create do |sai|
    vid = sai.variant_id
    pid = sai.product_id
    variant = ShopifyAPI::Variant.find(vid, :params => { :product_id => pid })
    case(sai.stock_adjustment.reason)
    when /D(efective|onation)/
      variant.inventory_quantity -= sai.count 
    else
      variant.inventory_quantity += sai.count
    end #case
    unless(variant.save)
      si.errors.add_to_base("Could not update the shoppify store!")
    end
  end
  
  
  
end
