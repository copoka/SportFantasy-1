# == Schema Information
#
# Table name: performances
#
#  id                             :integer          not null, primary key
#  player_id                      :integer
#  real_team_id                   :integer
#  amplua_id                      :integer
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

require 'rails_helper'

RSpec.describe Performance, :type => :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
