class CreateRealTeams < ActiveRecord::Migration
  def change
    create_table :real_teams do |t|
      t.string :name

      t.timestamps
    end
  end
end
