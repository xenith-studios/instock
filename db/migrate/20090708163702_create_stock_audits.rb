class CreateStockAudits < ActiveRecord::Migration
  def self.up
    create_table :stock_audits do |t|
      t.integer :shopify_store_id
      t.string :created_by
      t.timestamps
    end
  end

  def self.down
    drop_table :stock_audits
  end
end
