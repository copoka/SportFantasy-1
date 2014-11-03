require 'rails_helper'

RSpec.describe "total_performances/show", :type => :view do
  before(:each) do
    @total_performance = assign(:total_performance, TotalPerformance.create!(
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
  end
end
