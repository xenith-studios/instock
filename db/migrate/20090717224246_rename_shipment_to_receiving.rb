class RenameShipmentToReceiving < ActiveRecord::Migration
  def self.up 
    rename_table :shipments, :receivings
    rename_column :shipment_items, :shipment_id, :receiving_id
    rename_table :shipment_items, :receiving_items
  end

  def self.down
    rename_table :receivings, :shipments 
    rename_column :receiving_items_id, :receiving_id, :shipment_id
    rename_table :receiving_items, :shipment_items
  end
end
