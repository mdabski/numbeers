json.array!(@beers) do |beer|
  json.extract! beer, :id, :brewer, :name, :style, :url
  json.url admin_beer_url(beer, format: :json)
end
