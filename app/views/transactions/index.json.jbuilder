json.array!(@transactions) do |transaction|
  json.extract! transaction, :id, :keg_id, :contact_id
  json.url transaction_url(transaction, format: :json)
end
