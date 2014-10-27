require 'rails_helper'

RSpec.describe "user_teams/edit", :type => :view do
  before(:each) do
    @user_team = assign(:user_team, UserTeam.create!(
      :user => "",
      :name => "MyString",
      :score => 1
    ))
  end

  it "renders the edit user_team form" do
    render

    assert_select "form[action=?][method=?]", user_team_path(@user_team), "post" do

      assert_select "input#user_team_user[name=?]", "user_team[user]"

      assert_select "input#user_team_name[name=?]", "user_team[name]"

      assert_select "input#user_team_score[name=?]", "user_team[score]"
    end
  end
end
