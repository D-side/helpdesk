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

ActiveRecord::Schema.define(version: 20150827115051) do

  create_table "tickets", force: :cascade do |t|
    t.string   "reference"
    t.integer  "owner_id"
    t.string   "state",          default: "waiting_for_staff"
    t.string   "customer_name"
    t.string   "customer_email"
    t.string   "subject"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.text     "body"
  end

  add_index "tickets", ["owner_id"], name: "index_tickets_on_owner_id"
  add_index "tickets", ["reference"], name: "index_tickets_on_reference", unique: true
  add_index "tickets", ["state"], name: "index_tickets_on_state"

  create_table "users", force: :cascade do |t|
    t.string   "username",            default: "", null: false
    t.string   "encrypted_password",  default: "", null: false
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",       default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "failed_attempts",     default: 0,  null: false
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.boolean  "is_admin"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

end
