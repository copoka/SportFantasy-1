require 'rails_helper'

RSpec.describe "user_team_players/edit", :type => :view do
  before(:each) do
    @user_team_player = assign(:user_team_player, UserTeamPlayer.create!())
  end

  it "renders the edit user_team_player form" do
    render

    assert_select "form[action=?][method=?]", user_team_player_path(@user_team_player), "post" do
    end
  end
end
