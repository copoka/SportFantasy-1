require 'rails_helper'

RSpec.describe "UserTeams", :type => :request do
  describe "GET /user_teams" do
    it "works! (now write some real specs)" do
      get user_teams_path
      expect(response.status).to be(200)
    end
  end
end
