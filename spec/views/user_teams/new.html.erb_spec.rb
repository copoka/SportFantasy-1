require 'rails_helper'

RSpec.describe "user_teams/new", :type => :view do
  before(:each) do
    assign(:user_team, UserTeam.new(
      :user => "",
      :name => "MyString",
      :score => 1
    ))
  end

  it "renders new user_team form" do
    render

    assert_select "form[action=?][method=?]", user_teams_path, "post" do

      assert_select "input#user_team_user[name=?]", "user_team[user]"

      assert_select "input#user_team_name[name=?]", "user_team[name]"

      assert_select "input#user_team_score[name=?]", "user_team[score]"
    end
  end
end
