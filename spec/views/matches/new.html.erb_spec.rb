require 'rails_helper'

RSpec.describe "matches/new", :type => :view do
  before(:each) do
    assign(:match, Match.new(
      :team_home_id => 1,
      :team_away_id => 1,
      :team_home_score => 1,
      :team_away_score => 1,
      :highlights => "MyText"
    ))
  end

  it "renders new match form" do
    render

    assert_select "form[action=?][method=?]", matches_path, "post" do

      assert_select "input#match_team_home_id[name=?]", "match[team_home_id]"

      assert_select "input#match_team_away_id[name=?]", "match[team_away_id]"

      assert_select "input#match_team_home_score[name=?]", "match[team_home_score]"

      assert_select "input#match_team_away_score[name=?]", "match[team_away_score]"

      assert_select "textarea#match_highlights[name=?]", "match[highlights]"
    end
  end
end
