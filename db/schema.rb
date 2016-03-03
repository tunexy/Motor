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

ActiveRecord::Schema.define(version: 20160303172152) do

  create_table "comments", force: :cascade do |t|
    t.integer  "rating",     limit: 4
    t.text     "message",    limit: 65535
    t.boolean  "offer"
    t.integer  "user_id",    limit: 4
    t.integer  "advert_id",  limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "posts", force: :cascade do |t|
    t.integer  "rating",     limit: 4
    t.text     "message",    limit: 65535
    t.boolean  "offer"
    t.integer  "user_id",    limit: 4
    t.integer  "vehicle_id", limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "profiles", force: :cascade do |t|
    t.string   "title",               limit: 255
    t.string   "firstname",           limit: 255
    t.string   "lastname",            limit: 255
    t.date     "dateofbirth"
    t.string   "martialstatus",       limit: 255
    t.string   "phonenumber",         limit: 255
    t.string   "employmentstatus",    limit: 255
    t.text     "address",             limit: 65535
    t.string   "city",                limit: 255
    t.string   "country",             limit: 255
    t.integer  "user_id",             limit: 4
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "avatar_file_name",    limit: 255
    t.string   "avatar_content_type", limit: 255
    t.integer  "avatar_file_size",    limit: 4
    t.datetime "avatar_updated_at"
  end

  add_index "profiles", ["user_id"], name: "user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255,   default: "",    null: false
    t.string   "encrypted_password",     limit: 255,   default: "",    null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,     default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                           null: false
    t.datetime "updated_at",                                           null: false
    t.string   "confirmation_token",     limit: 255
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "username",               limit: 255
    t.string   "firstname",              limit: 255
    t.string   "lastname",               limit: 255
    t.date     "dateofbirth"
    t.boolean  "is_female",                            default: false
    t.string   "martialstatus",          limit: 255
    t.string   "phonenumber",            limit: 255
    t.string   "employmentstatus",       limit: 255
    t.text     "address",                limit: 65535
    t.string   "city",                   limit: 255
    t.string   "avatar_file_name",       limit: 255
    t.string   "avatar_content_type",    limit: 255
    t.integer  "avatar_file_size",       limit: 4
    t.datetime "avatar_updated_at"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "vehicles", force: :cascade do |t|
    t.text     "description",        limit: 65535
    t.string   "make",               limit: 255
    t.string   "model",              limit: 255
    t.date     "year"
    t.decimal  "enginesize",                       precision: 10
    t.integer  "cupiccapacity",      limit: 4
    t.decimal  "price",                            precision: 10
    t.string   "bodytype",           limit: 255
    t.string   "fueltype",           limit: 255
    t.integer  "milleage",           limit: 4
    t.string   "transmission",       limit: 255
    t.date     "taxdue"
    t.date     "nctdue"
    t.string   "platenumber",        limit: 255
    t.integer  "user_id",            limit: 4
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "image_file_name",    limit: 255
    t.string   "image_content_type", limit: 255
    t.integer  "image_file_size",    limit: 4
    t.datetime "image_updated_at"
  end

  add_index "vehicles", ["user_id"], name: "user_id", using: :btree

  add_foreign_key "profiles", "users", name: "profiles_ibfk_1"
  add_foreign_key "vehicles", "users", name: "vehicles_ibfk_1"
end
