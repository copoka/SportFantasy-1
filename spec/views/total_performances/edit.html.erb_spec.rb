require 'rails_helper'

RSpec.describe "total_performances/edit", :type => :view do
  before(:each) do
    @total_performance = assign(:total_performance, TotalPerformance.create!(
      :player_id => 1,
      :for_playing_up_to_60_minutes => 1,
      :for_playing_60_minutes_or_more => 1,
      :goals => 1,
      :assists => 1,
      :three_saves_gk => 1,
      :penalty_save_gk => 1,
      :penalty_miss => 1,
      :clean_sheet => 1,
      :mvps => 1,
      :every_two_goals_df_gk => 1,
      :yellow_cards => 1,
      :red_cards => 1,
      :self_goals => 1
    ))
  end

  it "renders the edit total_performance form" do
    render

    assert_select "form[action=?][method=?]", total_performance_path(@total_performance), "post" do

      assert_select "input#total_performance_player_id[name=?]", "total_performance[player_id]"

      assert_select "input#total_performance_for_playing_up_to_60_minutes[name=?]", "total_performance[for_playing_up_to_60_minutes]"

      assert_select "input#total_performance_for_playing_60_minutes_or_more[name=?]", "total_performance[for_playing_60_minutes_or_more]"

      assert_select "input#total_performance_goals[name=?]", "total_performance[goals]"

      assert_select "input#total_performance_assists[name=?]", "total_performance[assists]"

      assert_select "input#total_performance_three_saves_gk[name=?]", "total_performance[three_saves_gk]"

      assert_select "input#total_performance_penalty_save_gk[name=?]", "total_performance[penalty_save_gk]"

      assert_select "input#total_performance_penalty_miss[name=?]", "total_performance[penalty_miss]"

      assert_select "input#total_performance_clean_sheet[name=?]", "total_performance[clean_sheet]"

      assert_select "input#total_performance_mvps[name=?]", "total_performance[mvps]"

      assert_select "input#total_performance_every_two_goals_df_gk[name=?]", "total_performance[every_two_goals_df_gk]"

      assert_select "input#total_performance_yellow_cards[name=?]", "total_performance[yellow_cards]"

      assert_select "input#total_performance_red_cards[name=?]", "total_performance[red_cards]"

      assert_select "input#total_performance_self_goals[name=?]", "total_performance[self_goals]"
    end
  end
end
