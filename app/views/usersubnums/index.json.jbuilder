json.array!(@usersubnums) do |usersubnum|
  json.extract! usersubnum, :id, :subnum, :status, :createdate
  json.url usersubnum_url(usersubnum, format: :json)
end
