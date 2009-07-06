class CreateSShipments < ActiveRecord::Migration
  def self.up
    create_table :s_shipments do |t|
      t.integer :shopify_store_id
      t.datetime :created_at
      t.datetime :update_at

      t.timestamps
    end
  end

  def self.down
    drop_table :s_shipments
  end
end
