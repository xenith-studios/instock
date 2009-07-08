class CreateStockAuditItems < ActiveRecord::Migration
  def self.up
    create_table :stock_audit_items do |t|
      t.integer :stock_audit_id
      t.integer :product_id
      t.integer :variant_id
      t.string  :title
      t.string  :sku
      t.integer :expected_count
      t.integer :actual_count
      t.timestamps
    end
  end

  def self.down
    drop_table :stock_audit_items
  end
end
