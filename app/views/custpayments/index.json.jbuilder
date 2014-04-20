json.array!(@custpayments) do |custpayment|
  json.extract! custpayment, :id, :paymentsource, :paymentamount, :affectedinvoice, :createdate
  json.url custpayment_url(custpayment, format: :json)
end
