require 'rails_helper'

RSpec.describe "real_teams/edit", :type => :view do
  before(:each) do
    @real_team = assign(:real_team, RealTeam.create!(
      :name => "MyString"
    ))
  end

  it "renders the edit real_team form" do
    render

    assert_select "form[action=?][method=?]", real_team_path(@real_team), "post" do

      assert_select "input#real_team_name[name=?]", "real_team[name]"
    end
  end
end
