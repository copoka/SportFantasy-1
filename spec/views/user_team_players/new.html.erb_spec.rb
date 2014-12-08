require 'rails_helper'

RSpec.describe "user_team_players/new", :type => :view do
  before(:each) do
    assign(:user_team_player, UserTeamPlayer.new())
  end

  it "renders new user_team_player form" do
    render

    assert_select "form[action=?][method=?]", user_team_players_path, "post" do
    end
  end
end
