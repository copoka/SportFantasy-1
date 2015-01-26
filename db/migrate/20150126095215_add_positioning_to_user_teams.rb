class AddPositioningToUserTeams < ActiveRecord::Migration
  def change
    add_column :user_teams, :positioning, :string
  end
end
