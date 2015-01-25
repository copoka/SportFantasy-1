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

  POSITIONINGS={
      '2-4-4' => [
          ['col-md-6', 'col-md-6'],
          ['col-md-3', 'col-md-3', 'col-md-3', 'col-md-3'],
          ['col-md-3', 'col-md-3', 'col-md-3', 'col-md-3']
      ],
      '2-5-3' => [
          ['col-md-6', 'col-md-6'],
          ['col-md-2 col-offset-1', 'col-md-2', 'col-md-2', 'col-md-2', 'col-md-2'],
          ['col-md-4', 'col-md-4', 'col-md-4']
      ]
  }
  POSITIONINGS_NAMES= %w(FRW MID DEF)
end
