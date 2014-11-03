require 'rails_helper'

RSpec.describe "matches/show", :type => :view do
  before(:each) do
    @match = assign(:match, Match.create!(
      :team_home_id => 1,
      :team_away_id => 2,
      :team_home_score => 3,
      :team_away_score => 4,
      :highlights => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
    expect(rendered).to match(/MyText/)
  end
end
