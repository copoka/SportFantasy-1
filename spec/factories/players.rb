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
