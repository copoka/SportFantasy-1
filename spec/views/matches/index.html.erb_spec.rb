require 'rails_helper'

RSpec.describe "matches/index", :type => :view do
  before(:each) do
    assign(:matches, [
      Match.create!(
        :team_home_id => 1,
        :team_away_id => 2,
        :team_home_score => 3,
        :team_away_score => 4,
        :highlights => "MyText"
      ),
      Match.create!(
        :team_home_id => 1,
        :team_away_id => 2,
        :team_home_score => 3,
        :team_away_score => 4,
        :highlights => "MyText"
      )
    ])
  end

  it "renders a list of matches" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
