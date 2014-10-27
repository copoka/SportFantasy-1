class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :name
      t.belongs_to :real_team
      t.belongs_to :amplua
      t.float :price
      t.integer :score

      t.timestamps
    end
  end
end
