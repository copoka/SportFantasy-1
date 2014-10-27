require 'rails_helper'

RSpec.describe "RealTeams", :type => :request do
  describe "GET /real_teams" do
    it "works! (now write some real specs)" do
      get real_teams_path
      expect(response.status).to be(200)
    end
  end
end
