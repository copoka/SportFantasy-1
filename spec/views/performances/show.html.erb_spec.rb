require 'rails_helper'

RSpec.describe "performances/show", :type => :view do
  before(:each) do
    @performance = assign(:performance, Performance.create!(
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
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
    expect(rendered).to match(/5/)
    expect(rendered).to match(/6/)
    expect(rendered).to match(/7/)
    expect(rendered).to match(/8/)
    expect(rendered).to match(/9/)
    expect(rendered).to match(/10/)
    expect(rendered).to match(/11/)
    expect(rendered).to match(/12/)
    expect(rendered).to match(/13/)
    expect(rendered).to match(/14/)
    expect(rendered).to match(/15/)
    expect(rendered).to match(/16/)
  end
end
