require "rails_helper"

RSpec.describe AmpluasController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/ampluas").to route_to("ampluas#index")
    end

    it "routes to #new" do
      expect(:get => "/ampluas/new").to route_to("ampluas#new")
    end

    it "routes to #show" do
      expect(:get => "/ampluas/1").to route_to("ampluas#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/ampluas/1/edit").to route_to("ampluas#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/ampluas").to route_to("ampluas#create")
    end

    it "routes to #update" do
      expect(:put => "/ampluas/1").to route_to("ampluas#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/ampluas/1").to route_to("ampluas#destroy", :id => "1")
    end

  end
end
