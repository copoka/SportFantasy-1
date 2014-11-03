class AddScoresToPlayer < ActiveRecord::Migration
  def change
    add_column :players, :past_score_1, :integer, default: 0
    add_column :players, :past_score_2, :integer, default: 0
    add_column :players, :past_score_3, :integer, default: 0
    add_column :players, :past_score_4, :integer, default: 0
  end
end
