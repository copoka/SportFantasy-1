class CreatePerformances < ActiveRecord::Migration
  def change
    create_table :performances do |t|
      t.integer :player_id
      t.integer :real_team_id
      t.integer :amplua_id
      t.integer :for_playing_up_to_60_minutes
      t.integer :for_playing_60_minutes_or_more
      t.integer :goals
      t.integer :assists
      t.integer :three_saves_gk
      t.integer :penalty_save_gk
      t.integer :penalty_miss
      t.integer :clean_sheet
      t.integer :mvps
      t.integer :every_two_goals_df_gk
      t.integer :yellow_cards
      t.integer :red_cards
      t.integer :self_goals

      t.timestamps
    end
  end
end
