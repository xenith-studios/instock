class AddFieldsToShipment < ActiveRecord::Migration
  def self.up
    add_column :shipments, :po_number, :string
    add_column :shipments, :created_by, :string
  end

  def self.down
    remove_column :shipments, :created_by
    remove_column :shipments, :po_number
  end
end
