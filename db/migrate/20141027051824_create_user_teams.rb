class CreateUserTeams < ActiveRecord::Migration
  def change
    create_table :user_teams do |t|
      t.reference :user
      t.string :name
      t.integer :score

      t.timestamps
    end
  end
end
