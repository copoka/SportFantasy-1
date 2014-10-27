require "rails_helper"

RSpec.describe RealTeamsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/real_teams").to route_to("real_teams#index")
    end

    it "routes to #new" do
      expect(:get => "/real_teams/new").to route_to("real_teams#new")
    end

    it "routes to #show" do
      expect(:get => "/real_teams/1").to route_to("real_teams#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/real_teams/1/edit").to route_to("real_teams#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/real_teams").to route_to("real_teams#create")
    end

    it "routes to #update" do
      expect(:put => "/real_teams/1").to route_to("real_teams#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/real_teams/1").to route_to("real_teams#destroy", :id => "1")
    end

  end
end
