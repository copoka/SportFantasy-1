require 'rails_helper'

RSpec.describe "user_teams/index", :type => :view do
  before(:each) do
    assign(:user_teams, [
      UserTeam.create!(
        :user => "",
        :name => "Name",
        :score => 1
      ),
      UserTeam.create!(
        :user => "",
        :name => "Name",
        :score => 1
      )
    ])
  end

  it "renders a list of user_teams" do
    render
    assert_select "tr>td", :text => "".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
