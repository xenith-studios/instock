class CreateStockAdjustments < ActiveRecord::Migration
  def self.up
    create_table :stock_adjustments do |t|
      t.integer :shopify_store_id
      t.string :reason
      t.string :created_by

      t.timestamps
    end
    create_table :stock_adjustment_items do |t|
      t.integer  :stock_adjustment_id
      t.integer  :product_id
      t.integer  :variant_id
      t.string   :title
      t.string   :sku
      t.integer  :count
      
      t.timestamps
    end
  end

  def self.down
    drop_table :stock_adjustments
    drop_table :stock_adjustment_items
  end
end
