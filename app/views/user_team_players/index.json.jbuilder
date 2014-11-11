json.array!(@user_team_players) do |user_team_player|
  json.extract! user_team_player, :id
  json.url user_team_player_url(user_team_player, format: :json)

  json.user_team user_team_player.user_team, :id, :name if user_team_player.user_team
  json.player user_team_player.player, :id, :name if user_team_player.player
end