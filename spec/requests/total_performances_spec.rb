require 'rails_helper'

RSpec.describe "TotalPerformances", :type => :request do
  describe "GET /total_performances" do
    it "works! (now write some real specs)" do
      get total_performances_path
      expect(response.status).to be(200)
    end
  end
end
