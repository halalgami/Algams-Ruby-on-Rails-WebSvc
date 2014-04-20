class CreateGsmSigSurvs < ActiveRecord::Migration
  def change
    create_table "btc_gsm_sig_surv", primary_key: "trans_id", force: true do |t|
	    t.string   "user_id",           limit: 1000
	    t.integer  "sig_str"
	    t.float    "sig_lat"
	    t.float    "sig_longa"
	    t.datetime "pic_timestamp"
	    t.datetime "audit_create_date",              default: "now()"
	    t.datetime "audit_change_date"
    end    
  end
end
