require 'rails_helper'

RSpec.describe "UserTeamPlayers", :type => :request do
  describe "GET /user_team_players" do
    it "works! (now write some real specs)" do
      get user_team_players_path
      expect(response.status).to be(200)
    end
  end
end
