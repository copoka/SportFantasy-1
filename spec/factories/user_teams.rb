FactoryGirl.define do
  factory :user_team do
    name { Faker::Company.name }
    user

    factory :user_teams_with_players do
      transient do
        players_count 10
      end
      after(:create) do |user_team, evaluator|
        create_list(:user_team_player, evaluator.players_count, user_team: user_team)
      end
    end
  end
end
