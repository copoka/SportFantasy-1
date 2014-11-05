# == Schema Information
#
# Table name: players
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  real_team_id :integer
#  amplua_id    :integer
#  price        :float
#  score        :integer
#  created_at   :datetime
#  updated_at   :datetime
#  past_score_1 :integer          default(0)
#  past_score_2 :integer          default(0)
#  past_score_3 :integer          default(0)
#  past_score_4 :integer          default(0)
#

require 'faker'

FactoryGirl.define do
  factory :player do
    name {Faker::Name.name}
    amplua_id {(1..4).to_a.sample}
    price {(1..10).to_a.sample*1_000_000}
    score {(1..10).to_a.sample}
    real_team
  end
end
