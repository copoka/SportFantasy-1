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

class Match < ActiveRecord::Base
  belongs_to :team_home, :class_name => 'RealTeam', :foreign_key => 'team_home_id'
  belongs_to :team_away, :class_name => 'RealTeam', :foreign_key => 'team_away_id'
end
