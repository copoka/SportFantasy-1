# == Schema Information
#
# Table name: user_team_players
#
#  id           :integer          not null, primary key
#  user_team_id :integer
#  player_id    :integer
#  created_at   :datetime
#  updated_at   :datetime
#

FactoryGirl.define do
  #players_count=Player.count
  #puts "players_count: #{players_count}"

  factory :user_team_player do
    # user_team
    # TODO add condition for avoid adding same player in an user team
    # player_id { Player.first.id+Random.rand(Player.count) }
    player_id {user_team.user_team_players.count}
    #player
    # to_create {|instance| instance.save(validate: false) }

    factory :user_team_player_with_user_team do
      user_team {FactoryGirl.create :user_team}
    end
  end

  # factory :user_team_player_with_user_team do
  #   user_team {FactoryGirl.create :user_team}
  #   player_id {user_team.user_team_players.count}
  #   to_create {|instance| instance.save(validate: false) }
  # end
end
