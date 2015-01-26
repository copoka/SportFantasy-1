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
  MAX_PLAYERS_COUNT=15
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
  before_update :check_place_on_football_field

  #names for instance_eval
  FRW_MID_DEF=%w(first_team_forwards first_team_middels first_team_defenders)
  POSITIONINGS_NAMES= %w(FOR MID DEF)
  AMPLUA_POS_NAMES={
      'Нападающий' => "FOR",
      'Полузащитник' => "MID",
      'Защитник' => "DEF",
      'Вратарь' => "GK"
  }

  scope :first_team_players, -> { where(first_team: true) }
  scope :first_team_forwards, -> { first_team_players.where(player: Player.forwards) }
  scope :first_team_middels, -> { first_team_players.where(player: Player.middels) }
  scope :first_team_defenders, -> { first_team_players.where(player: Player.defenders) }
  scope :first_team_goalkeeper, -> { first_team_players.where(player: Player.goalkeepers) }

  private
  def check_max_players_count
    if self.user_team.user_team_players.count>=MAX_PLAYERS_COUNT
      errors.add(:max_players_count, "in your team is #{MAX_PLAYERS_COUNT}.")
      false
    end
  end

  def check_for_duplicates
    if self.user_team.players.include? self.player
      errors.add :player, "#{self.player.name} is already in your team."
      false
    end
  end

  def check_place_on_football_field
    return true if self.user_team.positioning.empty?
    amplua_key= AMPLUA_POS_NAMES[self.player.amplua.name]
    logger.info self.player.amplua.name.inspect
    logger.info amplua_key.inspect

    #first team may have only one goalkeeper
    if amplua_key=='GK'
      if self.user_team.user_team_players.first_team_goalkeeper.count>=1
        errors.add('gk_max_count', "in your team is 1.")
        return false
      else
        return true
      end
    end

    for_max_count, mid_max_count, def_max_count=self.user_team.positioning.split '-'
    pos_name=FRW_MID_DEF[POSITIONINGS_NAMES.index(amplua_key)]
    max_count=eval(amplua_key.downcase+'_max_count')
    if self.user_team.user_team_players.instance_eval(pos_name).count >= max_count
      errors.add(amplua_key.downcase+'_max_count', "in your team is #{max_count}.")
      false
    end
  end
end
