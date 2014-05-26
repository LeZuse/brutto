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

ActiveRecord::Schema.define(version: 20140526163313) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "agendas", force: true do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "agendas", ["name"], name: "index_agendas_on_name", unique: true, using: :btree

  create_table "invoice_lines", force: true do |t|
    t.integer  "invoice_id",  null: false
    t.decimal  "quantity",    null: false
    t.decimal  "unit_price",  null: false
    t.decimal  "vat",         null: false
    t.decimal  "cost"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "item_id"
    t.string   "description"
  end

  create_table "invoices", force: true do |t|
    t.integer  "user_id",             null: false
    t.datetime "original_created_at", null: false
    t.datetime "original_updated_at", null: false
    t.string   "currency",            null: false
    t.date     "issue_date",          null: false
    t.date     "paid_on"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "number",              null: false
    t.boolean  "has_vat",             null: false
  end

  add_index "invoices", ["original_created_at"], name: "index_invoices_on_original_created_at", using: :btree
  add_index "invoices", ["user_id"], name: "index_invoices_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "name"
    t.integer  "agenda_id"
  end

  add_index "users", ["agenda_id", "email"], name: "index_users_on_agenda_id_and_email", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
