class CreateAmpluas < ActiveRecord::Migration
  def change
    create_table :ampluas do |t|
      t.string :name

      t.timestamps
    end
  end
end
