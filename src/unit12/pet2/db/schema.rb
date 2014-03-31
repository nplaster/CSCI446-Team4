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

ActiveRecord::Schema.define(version: 20140331203156) do

  create_table "animals", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "image_url"
    t.integer  "age"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "status_id"
    t.string   "gender"
  end

  add_index "animals", ["status_id"], name: "index_animals_on_status_id"

  create_table "considers", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "foster_parents", force: true do |t|
    t.string   "name"
    t.text     "address"
    t.string   "email"
    t.string   "animal_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fosters", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "line_items", force: true do |t|
    t.integer  "animal_id"
    t.integer  "foster_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "line_items", ["animal_id"], name: "index_line_items_on_animal_id"
  add_index "line_items", ["foster_id"], name: "index_line_items_on_foster_id"

  create_table "possible_items", force: true do |t|
    t.integer  "animal_id"
    t.integer  "consider_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "quantity",    default: 1
  end

  add_index "possible_items", ["animal_id"], name: "index_possible_items_on_animal_id"
  add_index "possible_items", ["consider_id"], name: "index_possible_items_on_consider_id"

  create_table "users", force: true do |t|
    t.string   "email",                        null: false
    t.string   "crypted_password",             null: false
    t.string   "salt",                         null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_me_token"
    t.datetime "remember_me_token_expires_at"
    t.datetime "last_login_at"
    t.datetime "last_logout_at"
    t.datetime "last_activity_at"
    t.string   "last_login_from_ip_address"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["last_logout_at", "last_activity_at"], name: "index_users_on_last_logout_at_and_last_activity_at"
  add_index "users", ["remember_me_token"], name: "index_users_on_remember_me_token"

end
