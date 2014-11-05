# == Schema Information
#
# Table name: user_teams
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  name       :string(255)
#  score      :integer
#  created_at :datetime
#  updated_at :datetime
#

class UserTeam < ActiveRecord::Base
  belongs_to :user
  has_many :user_team_players
  has_many :players, through: :user_team_players
end
