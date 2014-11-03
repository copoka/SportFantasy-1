# == Schema Information
#
# Table name: matches
#
#  id              :integer          not null, primary key
#  team_home_id    :integer
#  team_away_id    :integer
#  team_home_score :integer
#  team_away_score :integer
#  highlights      :text
#  created_at      :datetime
#  updated_at      :datetime
#

FactoryGirl.define do
  factory :match do
    team_home_id 1
team_away_id 1
team_home_score 1
team_away_score 1
highlights "MyText"
  end

end
