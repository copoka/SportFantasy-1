class AddFirstTeamBool < ActiveRecord::Migration
  def change
      change_table :user_team_players do |t|
        t.boolean :first_team
      end
  end
end
