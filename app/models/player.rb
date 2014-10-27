class Player < ActiveRecord::Base
  has_one :real_team
  has_one :amplua
  has_many :user_team_players
  has_many :user_teams, through: :user_team_players
end
