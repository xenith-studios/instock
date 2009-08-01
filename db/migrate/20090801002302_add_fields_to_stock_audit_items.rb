class AddFieldsToStockAuditItems < ActiveRecord::Migration
  def self.up
    add_column :stock_audit_items, :product_title, :string
    add_column :stock_audit_items, :vendor, :string
  end

  def self.down
    remove_column :stock_audit_items, :vendor
    remove_column :stock_audit_items, :product_title
  end
end
