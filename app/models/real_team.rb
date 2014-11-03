class RealTeam < ActiveRecord::Base
  has_many :players
  has_many :home_matches, :class_name => 'Match', :foreign_key => 'team_home_id'
  has_many :away_matches, :class_name => 'Match', :foreign_key => 'team_away_id'
  has_many :perfomances
end
