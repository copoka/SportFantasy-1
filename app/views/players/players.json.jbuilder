json.array!(@players) do |player|
  json.extract! player, :id, :name, :real_team, :amplua, :price, :score
  json.url player_url(player, format: :json)
end
