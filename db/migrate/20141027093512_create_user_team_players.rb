class CreateUserTeamPlayers < ActiveRecord::Migration
  def change
    create_table :user_team_players do |t|
      t.belongs_to :user_team, index: true
      t.belongs_to :player, index: true

      t.timestamps
    end
  end
end
