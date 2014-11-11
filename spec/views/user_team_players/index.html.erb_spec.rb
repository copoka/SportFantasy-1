require 'rails_helper'

RSpec.describe "user_team_players/index", :type => :view do
  before(:each) do
    assign(:user_team_players, [
      UserTeamPlayer.create!(),
      UserTeamPlayer.create!()
    ])
  end

  it "renders a list of user_team_players" do
    render
  end
end
