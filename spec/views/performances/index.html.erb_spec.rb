require 'rails_helper'

RSpec.describe "performances/index", :type => :view do
  before(:each) do
    assign(:performances, [
      Performance.create!(
        :player_id => 1,
        :real_team_id => 2,
        :amplua_id => 3,
        :for_playing_up_to_60_minutes => 4,
        :for_playing_60_minutes_or_more => 5,
        :goals => 6,
        :assists => 7,
        :three_saves_gk => 8,
        :penalty_save_gk => 9,
        :penalty_miss => 10,
        :clean_sheet => 11,
        :mvps => 12,
        :every_two_goals_df_gk => 13,
        :yellow_cards => 14,
        :red_cards => 15,
        :self_goals => 16
      ),
      Performance.create!(
        :player_id => 1,
        :real_team_id => 2,
        :amplua_id => 3,
        :for_playing_up_to_60_minutes => 4,
        :for_playing_60_minutes_or_more => 5,
        :goals => 6,
        :assists => 7,
        :three_saves_gk => 8,
        :penalty_save_gk => 9,
        :penalty_miss => 10,
        :clean_sheet => 11,
        :mvps => 12,
        :every_two_goals_df_gk => 13,
        :yellow_cards => 14,
        :red_cards => 15,
        :self_goals => 16
      )
    ])
  end

  it "renders a list of performances" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => 5.to_s, :count => 2
    assert_select "tr>td", :text => 6.to_s, :count => 2
    assert_select "tr>td", :text => 7.to_s, :count => 2
    assert_select "tr>td", :text => 8.to_s, :count => 2
    assert_select "tr>td", :text => 9.to_s, :count => 2
    assert_select "tr>td", :text => 10.to_s, :count => 2
    assert_select "tr>td", :text => 11.to_s, :count => 2
    assert_select "tr>td", :text => 12.to_s, :count => 2
    assert_select "tr>td", :text => 13.to_s, :count => 2
    assert_select "tr>td", :text => 14.to_s, :count => 2
    assert_select "tr>td", :text => 15.to_s, :count => 2
    assert_select "tr>td", :text => 16.to_s, :count => 2
  end
end
