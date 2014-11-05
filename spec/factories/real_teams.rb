# == Schema Information
#
# Table name: real_teams
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

require 'faker'

FactoryGirl.define do
  factory :real_team do
    name {Faker::Company.name}

    factory :real_team_with_players do
      transient do
        players_count 10
      end
      after(:create) do |real_team, evaluator|
        create_list(:player, evaluator.players_count, real_team: real_team)
      end

      #before_create do |real_team|
      #  10.times do
      #    real_team.players << FactoryGirl.create(:player, real_team: real_team)
      #  end
      #end
    end
  end
end
