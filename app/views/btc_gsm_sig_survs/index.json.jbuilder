json.array!(@btc_gsm_sig_survs) do |btc_gsm_sig_surv|
  json.extract! btc_gsm_sig_surv, :id, :user_id, :sig_str, :latitude, :longitude, :pic_timestamp, :audit_create_date, :audit_change_date, :userinfo
  json.url btc_gsm_sig_surv_url(btc_gsm_sig_surv, format: :json)
end
