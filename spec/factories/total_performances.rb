# == Schema Information
#
# Table name: total_performances
#
#  id                             :integer          not null, primary key
#  player_id                      :integer
#  for_playing_up_to_60_minutes   :integer
#  for_playing_60_minutes_or_more :integer
#  goals                          :integer
#  assists                        :integer
#  three_saves_gk                 :integer
#  penalty_save_gk                :integer
#  penalty_miss                   :integer
#  clean_sheet                    :integer
#  mvps                           :integer
#  every_two_goals_df_gk          :integer
#  yellow_cards                   :integer
#  red_cards                      :integer
#  self_goals                     :integer
#  created_at                     :datetime
#  updated_at                     :datetime
#

FactoryGirl.define do
  factory :total_performance do
    player_id 1
for_playing_up_to_60_minutes 1
for_playing_60_minutes_or_more 1
goals 1
assists 1
three_saves_gk 1
penalty_save_gk 1
penalty_miss 1
clean_sheet 1
mvps 1
every_two_goals_df_gk 1
yellow_cards 1
red_cards 1
self_goals 1
  end

end
