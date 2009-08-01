# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20090801002302) do

  create_table "receiving_items", :force => true do |t|
    t.integer  "receiving_id"
    t.integer  "product_id"
    t.integer  "variant_id"
    t.string   "title"
    t.string   "sku"
    t.integer  "count"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "receivings", :force => true do |t|
    t.integer  "shopify_store_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "po_number"
    t.string   "created_by"
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "stock_audit_items", :force => true do |t|
    t.integer  "stock_audit_id"
    t.integer  "product_id"
    t.integer  "variant_id"
    t.string   "title"
    t.string   "sku"
    t.integer  "expected_count"
    t.integer  "actual_count"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "product_title"
    t.string   "vendor"
  end

  create_table "stock_audits", :force => true do |t|
    t.integer  "shopify_store_id"
    t.string   "created_by"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "deleted",          :default => false
  end

end
