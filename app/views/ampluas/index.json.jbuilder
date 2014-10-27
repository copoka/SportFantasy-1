json.array!(@ampluas) do |amplua|
  json.extract! amplua, :id, :name
  json.url amplua_url(amplua, format: :json)
end
