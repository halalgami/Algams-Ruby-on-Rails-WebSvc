class CreateBtcGsmSigSurvs < ActiveRecord::Migration
  def change
    create_table :btc_gsm_sig_survs do |t|
      t.string :user_id
      t.integer :sig_str
      t.float :sig_lat
      t.float :sig_longa
      t.datetime :pic_timestamp
      t.datetime :audit_create_date
      t.datetime :audit_change_date
      t.text :userinfo

      t.timestamps
    end
  end
end
