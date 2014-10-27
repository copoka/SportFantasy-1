class UserTeam < ActiveRecord::Base
  has_one :user
  has_many :user_team_players
  has_many :players, through: :user_team_players
end
