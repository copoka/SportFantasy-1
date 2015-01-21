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
  MAX_PLAYERS_COUNT=5
  belongs_to :user_team
  belongs_to :player

  validates :player_id,
            presence: true,
            numericality: {only_integer: true}

  validates :first_team,
            :inclusion => {:in => [true, false, nil]}

  validates :user_team_id,
            presence: true,
            numericality: {only_integer: true}

  before_update do |user_team_player|

  end
  before_create :check_max_players_count, :check_for_duplicates

  private
  def check_max_players_count
    if self.user_team.user_team_players.count>=MAX_PLAYERS_COUNT
      errors.add(:max_players_count, "in your team is #{MAX_PLAYERS_COUNT}.")
      return false
    end
  end

  def check_for_duplicates
    if self.user_team.players.include? self.player
      errors.add :player, "#{self.player.name} is already in your team."
      return false
    end
  end
end
