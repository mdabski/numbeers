json.array!(@kegs) do |keg|
  json.extract! keg, :id, :size, :price, :start_date, :end_date, :beer_id
  json.url keg_url(keg, format: :json)
end
