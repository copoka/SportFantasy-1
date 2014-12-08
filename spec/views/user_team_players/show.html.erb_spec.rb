require 'rails_helper'

RSpec.describe "user_team_players/show", :type => :view do
  before(:each) do
    @user_team_player = assign(:user_team_player, UserTeamPlayer.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
