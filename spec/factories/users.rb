require 'faker'

FactoryGirl.define do
  factory :user do
    name { Faker::Name.name }

    factory :user_with_teams do
      transient do
        teams_count 2
      end
      after(:create) do |user, evaluator|
        create_list(:user_team, evaluator.teamz_count, user: user)
      end
      #TODO make it done
      factory :user_with_teams_and_players do
        transient do
          players_count 2
        end
        after(:create) do |user, evaluator|
          create_list(:user_team, evaluator.players_count, user: user)
        end
      end
    end
  end
end
