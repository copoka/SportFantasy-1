json.array!(@real_teams) do |real_team|
  json.extract! real_team, :id, :name
  json.url real_team_url(real_team, format: :json)
end
