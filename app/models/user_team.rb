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

  # POSITIONINGS={
  #     '2-4-4' => [
  #         ['col-md-6', 'col-md-6'],
  #         ['col-md-3', 'col-md-3', 'col-md-3', 'col-md-3'],
  #         ['col-md-3', 'col-md-3', 'col-md-3', 'col-md-3']
  #     ],
  #     '2-5-3' => [
  #         ['col-md-6', 'col-md-6'],
  #         ['col-md-2 col-offset-1', 'col-md-2', 'col-md-2', 'col-md-2', 'col-md-2'],
  #         ['col-md-4', 'col-md-4', 'col-md-4']
  #     ]
  # }

  POSITIONINGS= %w(2-4-4 2-5-3)

  #TODO change description
  #exm: first forward player in first_team is:
  #@user_team.user_team_players.instance_eval(UserTeamPlayer::FRW_MID_DEF[0])[0]
  #@user_team.user_team_players.instance_eval('first_team_forwards')[0]
  #@user_team.user_team_players.first_team_forwards[0]
  def players_on_football_field
    players_on_football_field=[]
    UserTeamPlayer::FRW_MID_DEF.each { |name| players_on_football_field<< self.user_team_players.instance_eval(name) }
    players_on_football_field
  end

  #TODO add 'check players_on_football_field before user_team positioning has been changed'
end
