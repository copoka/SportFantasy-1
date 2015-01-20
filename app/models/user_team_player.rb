# == Schema Information
#
# Table name: user_team_players
#
#  id           :integer          not null, primary key
#  user_team_id :integer
#  player_id    :integer
#  created_at   :datetime
#  updated_at   :datetime
#  first_team   :boolean
#

class UserTeamPlayer < ActiveRecord::Base
  belongs_to :user_team
  belongs_to :player

  validates  :player_id,
                presence: true,
                numericality: { only_integer: true }

  validates  :first_team,
                :inclusion => {:in => [true, false, nil]}

  validates :user_team_id,
                presence: true,
                numericality: { only_integer: true }

  before_update do |user_team_player|
      
  end

end
