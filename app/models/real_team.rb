# == Schema Information
#
# Table name: real_teams
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class RealTeam < ActiveRecord::Base
  has_many :players
  has_many :home_matches, :class_name => 'Match', :foreign_key => 'team_home_id'
  has_many :away_matches, :class_name => 'Match', :foreign_key => 'team_away_id'
  has_many :performances
end
