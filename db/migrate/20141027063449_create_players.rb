class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :name
      t.reference :real_team
      t.reference :amplua
      t.float :price
      t.integer :score

      t.timestamps
    end
  end
end
