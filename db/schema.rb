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

ActiveRecord::Schema.define(version: 20140203121254) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "api_keys", force: true do |t|
    t.string   "access_token"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "btc_gsm_sig_survs", force: true do |t|
    t.string   "user_id"
    t.integer  "sig_str"
    t.float    "latitude"
    t.float    "longitude"
    t.datetime "pic_timestamp"
    t.datetime "audit_create_date"
    t.datetime "audit_change_date"
    t.text     "userinfo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "custinvoices", force: true do |t|
    t.integer  "usersubnumfk"
    t.integer  "usersubseqnumfk"
    t.decimal  "invoiceamount"
    t.string   "billyear"
    t.string   "billperiod"
    t.integer  "affectedinvoice"
    t.datetime "createdate"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "custpayments", force: true do |t|
    t.string   "paymentsource"
    t.decimal  "paymentamount"
    t.integer  "affectedinvoice"
    t.datetime "createdate"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "locweb_thepics", force: true do |t|
    t.string   "posted_by"
    t.string   "pic_name"
    t.string   "pic_location_name"
    t.string   "pic_coords"
    t.datetime "pic_timestamp"
    t.string   "pic_image_path"
    t.text     "pic_weather_currently"
    t.string   "pic_status"
    t.text     "pic_link"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "password"
    t.string   "email"
    t.string   "password_digest"
    t.string   "realname"
    t.string   "status"
    t.text     "userinfo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "usersubnums", force: true do |t|
    t.integer  "subnum"
    t.string   "status"
    t.datetime "createdate"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
