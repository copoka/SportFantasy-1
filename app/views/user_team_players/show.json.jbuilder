#json.extract! @user_team_player, :id, :created_at, :updated_at

  json.extract! @user_team_player, :id, :created_at, :updated_at

  json.user_team @user_team_player.user_team, :id, :name if @user_team_player.user_team
  json.player @user_team_player.player, :id, :name if @user_team_player.player

