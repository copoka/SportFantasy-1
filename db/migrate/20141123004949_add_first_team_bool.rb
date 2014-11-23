class AddFirstTeamBool < ActiveRecord::Migration
  def change
      change_table :User_Team_Players do |t|
        t.boolean :first_team, null: false
      end
  end
end
