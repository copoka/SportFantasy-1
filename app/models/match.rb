class Match < ActiveRecord::Base
  belongs_to :team_home, :class_name => 'RealTeam', :foreign_key => 'team_home_id'
  belongs_to :team_away, :class_name => 'RealTeam', :foreign_key => 'team_away_id'
end
