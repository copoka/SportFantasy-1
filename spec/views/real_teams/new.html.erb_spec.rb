require 'rails_helper'

RSpec.describe "real_teams/new", :type => :view do
  before(:each) do
    assign(:real_team, RealTeam.new(
      :name => "MyString"
    ))
  end

  it "renders new real_team form" do
    render

    assert_select "form[action=?][method=?]", real_teams_path, "post" do

      assert_select "input#real_team_name[name=?]", "real_team[name]"
    end
  end
end
