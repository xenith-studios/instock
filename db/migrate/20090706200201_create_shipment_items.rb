class CreateShipmentItems < ActiveRecord::Migration
  def self.up
    create_table :shipment_items do |t|
      t.integer :shipment_id
      t.integer :variant_id
      t.integer :count

      t.timestamps
    end
  end

  def self.down
    drop_table :shipment_items
  end
end
