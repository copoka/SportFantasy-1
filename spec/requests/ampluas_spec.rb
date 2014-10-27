require 'rails_helper'

RSpec.describe "Ampluas", :type => :request do
  describe "GET /ampluas" do
    it "works! (now write some real specs)" do
      get ampluas_path
      expect(response.status).to be(200)
    end
  end
end
