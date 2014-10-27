require 'rails_helper'

RSpec.describe "real_teams/index", :type => :view do
  before(:each) do
    assign(:real_teams, [
      RealTeam.create!(
        :name => "Name"
      ),
      RealTeam.create!(
        :name => "Name"
      )
    ])
  end

  it "renders a list of real_teams" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
