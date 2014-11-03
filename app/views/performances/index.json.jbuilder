json.array!(@performances) do |performance|
  json.extract! performance, :id, :player_id, :real_team_id, :amplua_id, :for_playing_up_to_60_minutes, :for_playing_60_minutes_or_more, :goals, :assists, :three_saves_gk, :penalty_save_gk, :penalty_miss, :clean_sheet, :mvps, :every_two_goals_df_gk, :yellow_cards, :red_cards, :self_goals
  json.url performance_url(performance, format: :json)
end
