json.array!(@matches) do |match|
  json.extract! match, :id, :team_home_id, :team_away_id, :team_home_score, :team_away_score, :highlights
  json.url match_url(match, format: :json)
end
