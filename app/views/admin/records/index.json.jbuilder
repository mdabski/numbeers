json.array!(@records) do |record|
  json.extract! record, :id, :contact_id, :amount
  json.url record_url(record, format: :json)
end
