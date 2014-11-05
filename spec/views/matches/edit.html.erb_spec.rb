require 'rails_helper'

RSpec.describe "matches/edit", :type => :view do
  before(:each) do
    @match = assign(:match, Match.create!(
      :team_home_id => 1,
      :team_away_id => 1,
      :team_home_score => 1,
      :team_away_score => 1,
      :highlights => "MyText"
    ))
  end

  it "renders the edit match form" do
    render

    assert_select "form[action=?][method=?]", match_path(@match), "post" do

      assert_select "input#match_team_home_id[name=?]", "match[team_home_id]"

      assert_select "input#match_team_away_id[name=?]", "match[team_away_id]"

      assert_select "input#match_team_home_score[name=?]", "match[team_home_score]"

      assert_select "input#match_team_away_score[name=?]", "match[team_away_score]"

      assert_select "textarea#match_highlights[name=?]", "match[highlights]"
    end
  end
end
