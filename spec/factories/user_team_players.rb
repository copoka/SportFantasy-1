FactoryGirl.define do
  #players_count=Player.count
  #puts "players_count: #{players_count}"

  factory :user_team_player do
    user_team
    player_id{Random.rand Player.count}
  end
end
