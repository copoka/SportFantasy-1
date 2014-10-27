require "rails_helper"

RSpec.describe UserTeamsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/user_teams").to route_to("user_teams#index")
    end

    it "routes to #new" do
      expect(:get => "/user_teams/new").to route_to("user_teams#new")
    end

    it "routes to #show" do
      expect(:get => "/user_teams/1").to route_to("user_teams#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/user_teams/1/edit").to route_to("user_teams#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/user_teams").to route_to("user_teams#create")
    end

    it "routes to #update" do
      expect(:put => "/user_teams/1").to route_to("user_teams#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/user_teams/1").to route_to("user_teams#destroy", :id => "1")
    end

  end
end
