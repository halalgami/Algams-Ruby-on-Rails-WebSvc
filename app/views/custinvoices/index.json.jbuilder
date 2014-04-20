json.array!(@custinvoices) do |custinvoice|
  json.extract! custinvoice, :id, :usersubnumfk, :usersubseqnumfk, :invoiceamount, :billyear, :billperiod, :affectedinvoice, :createdate
  json.url custinvoice_url(custinvoice, format: :json)
end
