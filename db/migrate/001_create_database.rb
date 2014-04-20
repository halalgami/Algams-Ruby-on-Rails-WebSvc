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

class CreateDatabase < ActiveRecord::Migration
 def self.up
  ActiveRecord::Schema.define(version: 0) do
  
	  # These are extensions that must be enabled in order to support this database
	  enable_extension "plpgsql"
	
	  create_table "btc_gsm_sig_surv", primary_key: "trans_id", force: true do |t|
	    t.string   "user_id",           limit: 1000
	    t.integer  "sig_str"
	    t.float    "sig_lat"
	    t.float    "sig_longa"
	    t.datetime "pic_timestamp"
	    t.datetime "audit_create_date",              default: "now()"
	    t.datetime "audit_change_date"
	  end
	
	  create_table "custinvoices", primary_key: "invoicenum", force: true do |t|
	    t.integer  "usersubnumfk",    limit: 8
	    t.integer  "usersubseqnumfk", limit: 8
	    t.decimal  "invoiceamount",              precision: 19, scale: 2
	    t.string   "billyear",        limit: 10
	    t.string   "billperiod",      limit: 10
	    t.integer  "affectedinvoice", limit: 8
	    t.datetime "createdate",                                          default: "now()"
	  end
	
	  create_table "custpayments", primary_key: "paymentid", force: true do |t|
	    t.string   "paymentsource",   limit: 10
	    t.decimal  "paymentamount",              precision: 19, scale: 2
	    t.integer  "affectedinvoice", limit: 8
	    t.datetime "createdate",                                          default: "now()"
	  end
	
	  create_table "locweb_thepics", primary_key: "pic_id", force: true do |t|
	    t.string   "pic_name",              limit: 1000
	    t.string   "pic_location_name",     limit: 1000
	    t.string   "pic_coords",            limit: 500
	    t.datetime "pic_timestamp"
	    t.string   "pic_image_path",        limit: 500
	    t.text     "pic_weather_currently"
	    t.string   "pic_status",            limit: 100
	    t.text     "pic_link"
	    t.datetime "audit_create_date",                  default: "now()"
	    t.datetime "audit_change_date"
	  end
	
	  create_table "users", primary_key: "seqnumber", force: true do |t|
	    t.string   "username",   limit: 500
	    t.string   "password",   limit: 100
	    t.string   "realname",   limit: 1000
	    t.string   "status",     limit: 10
	    t.datetime "createdate",              default: "now()"
	  end
	
	  create_table "usersubnum", primary_key: "usersubseqnum", force: true do |t|
	    t.integer  "subnum",     limit: 8
	    t.string   "status",     limit: 10
	    t.datetime "createdate",            default: "now()"
	  end
  	  
  end
  
 end
end 
