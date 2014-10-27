class CreateUserTeams < ActiveRecord::Migration
  def change
    create_table :user_teams do |t|
      t.belongs_to :user, index: true
      t.string :name
      t.integer :score

      t.timestamps
    end
  end
end
