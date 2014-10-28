class Player < ActiveRecord::Base
  belongs_to :real_team
  belongs_to :amplua
  has_many :user_team_players
  has_many :user_teams, through: :user_team_players
end
