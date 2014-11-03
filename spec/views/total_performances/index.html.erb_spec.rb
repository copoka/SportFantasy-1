require 'rails_helper'

RSpec.describe "total_performances/index", :type => :view do
  before(:each) do
    assign(:total_performances, [
      TotalPerformance.create!(
        :player_id => 1,
        :for_playing_up_to_60_minutes => 2,
        :for_playing_60_minutes_or_more => 3,
        :goals => 4,
        :assists => 5,
        :three_saves_gk => 6,
        :penalty_save_gk => 7,
        :penalty_miss => 8,
        :clean_sheet => 9,
        :mvps => 10,
        :every_two_goals_df_gk => 11,
        :yellow_cards => 12,
        :red_cards => 13,
        :self_goals => 14
      ),
      TotalPerformance.create!(
        :player_id => 1,
        :for_playing_up_to_60_minutes => 2,
        :for_playing_60_minutes_or_more => 3,
        :goals => 4,
        :assists => 5,
        :three_saves_gk => 6,
        :penalty_save_gk => 7,
        :penalty_miss => 8,
        :clean_sheet => 9,
        :mvps => 10,
        :every_two_goals_df_gk => 11,
        :yellow_cards => 12,
        :red_cards => 13,
        :self_goals => 14
      )
    ])
  end

  it "renders a list of total_performances" do
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
  end
end
