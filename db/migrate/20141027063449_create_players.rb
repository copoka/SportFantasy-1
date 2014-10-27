class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :name
      t.belongs_to :real_team, index: true
      t.belongs_to :amplua, index: true
      t.float :price
      t.integer :score

      t.timestamps
    end
  end
end
