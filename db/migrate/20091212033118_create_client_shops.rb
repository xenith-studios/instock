class CreateClientShops < ActiveRecord::Migration
  def self.up
    create_table :client_shops do |t|
      t.string :domain
      t.string :name
      t.integer :shopify_store_id
      t.string :email
      t.string :name
      t.string :shop_owner
      t.integer :active_subscription_id

      t.timestamps
    end
  end

  def self.down
    drop_table :client_shops
  end
end
