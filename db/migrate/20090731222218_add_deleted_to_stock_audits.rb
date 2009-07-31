class AddDeletedToStockAudits < ActiveRecord::Migration
  def self.up
    add_column :stock_audits, :deleted, :boolean, :default => false
  end

  def self.down
    remove_column :stock_audits, :deleted
  end
end
