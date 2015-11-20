# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20151120142053) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "no_nags", force: :cascade do |t|
    t.integer  "site_id",    null: false
    t.integer  "author_id"
    t.integer  "ticket_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "no_nags", ["site_id", "author_id"], name: "index_no_nags_on_site_id_and_author_id", using: :btree
  add_index "no_nags", ["site_id", "ticket_id"], name: "index_no_nags_on_site_id_and_ticket_id", using: :btree
  add_index "no_nags", ["site_id"], name: "index_no_nags_on_site_id", using: :btree

  create_table "site_configs", force: :cascade do |t|
    t.integer  "site_id",                 null: false
    t.string   "nag",        limit: 5000
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "site_configs", ["site_id"], name: "index_site_configs_on_site_id", using: :btree

  create_table "sites", force: :cascade do |t|
    t.string   "auid",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "sites", ["auid"], name: "index_sites_on_auid", using: :btree

end
