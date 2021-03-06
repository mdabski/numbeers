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

ActiveRecord::Schema.define(version: 20151007131754) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "beers", force: true do |t|
    t.string   "brewer"
    t.string   "name"
    t.string   "style"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contacts", force: true do |t|
    t.integer  "user_id"
    t.integer  "numbeer_id"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone_number"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "happy_hour"
    t.boolean  "active",       default: true
  end

  create_table "kegs", force: true do |t|
    t.integer  "size"
    t.float    "price"
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "beer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "kegs", ["beer_id"], name: "index_kegs_on_beer_id", using: :btree

  create_table "records", force: true do |t|
    t.integer  "contact_id"
    t.decimal  "amount"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "description"
  end

  add_index "records", ["contact_id"], name: "index_records_on_contact_id", using: :btree

  create_table "transactions", force: true do |t|
    t.integer  "keg_id"
    t.integer  "contact_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "billable",   default: true
  end

  add_index "transactions", ["contact_id"], name: "index_transactions_on_contact_id", using: :btree
  add_index "transactions", ["keg_id"], name: "index_transactions_on_keg_id", using: :btree

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
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
