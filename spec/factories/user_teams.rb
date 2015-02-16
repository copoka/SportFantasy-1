# == Schema Information
#
# Table name: user_teams
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  name       :string(255)
#  score      :integer
#  created_at :datetime
#  updated_at :datetime
#

FactoryGirl.define do
  factory :user_team do
    name { Faker::Company.name }
    user
    positioning '2-4-4'

    factory :user_team_with_players do
      transient do
        players_count 10
      end
      after(:create) do |user_team, evaluator|
        create_list(:user_team_player, evaluator.players_count, user_team: user_team)
      end
    end
  end
end
