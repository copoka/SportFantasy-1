class AddFirstTeamBool < ActiveRecord::Migration
  def change
      change_table :User_Team_Players do |t|
        t.boolean :first_team
      end
  end
end
