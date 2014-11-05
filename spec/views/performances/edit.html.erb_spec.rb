require 'rails_helper'

RSpec.describe "performances/edit", :type => :view do
  before(:each) do
    @performance = assign(:performance, Performance.create!(
      :player_id => 1,
      :real_team_id => 1,
      :amplua_id => 1,
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

  it "renders the edit performance form" do
    render

    assert_select "form[action=?][method=?]", performance_path(@performance), "post" do

      assert_select "input#performance_player_id[name=?]", "performance[player_id]"

      assert_select "input#performance_real_team_id[name=?]", "performance[real_team_id]"

      assert_select "input#performance_amplua_id[name=?]", "performance[amplua_id]"

      assert_select "input#performance_for_playing_up_to_60_minutes[name=?]", "performance[for_playing_up_to_60_minutes]"

      assert_select "input#performance_for_playing_60_minutes_or_more[name=?]", "performance[for_playing_60_minutes_or_more]"

      assert_select "input#performance_goals[name=?]", "performance[goals]"

      assert_select "input#performance_assists[name=?]", "performance[assists]"

      assert_select "input#performance_three_saves_gk[name=?]", "performance[three_saves_gk]"

      assert_select "input#performance_penalty_save_gk[name=?]", "performance[penalty_save_gk]"

      assert_select "input#performance_penalty_miss[name=?]", "performance[penalty_miss]"

      assert_select "input#performance_clean_sheet[name=?]", "performance[clean_sheet]"

      assert_select "input#performance_mvps[name=?]", "performance[mvps]"

      assert_select "input#performance_every_two_goals_df_gk[name=?]", "performance[every_two_goals_df_gk]"

      assert_select "input#performance_yellow_cards[name=?]", "performance[yellow_cards]"

      assert_select "input#performance_red_cards[name=?]", "performance[red_cards]"

      assert_select "input#performance_self_goals[name=?]", "performance[self_goals]"
    end
  end
end
