require "rails_helper"

RSpec.describe TotalPerformancesController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/total_performances").to route_to("total_performances#index")
    end

    it "routes to #new" do
      expect(:get => "/total_performances/new").to route_to("total_performances#new")
    end

    it "routes to #show" do
      expect(:get => "/total_performances/1").to route_to("total_performances#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/total_performances/1/edit").to route_to("total_performances#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/total_performances").to route_to("total_performances#create")
    end

    it "routes to #update" do
      expect(:put => "/total_performances/1").to route_to("total_performances#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/total_performances/1").to route_to("total_performances#destroy", :id => "1")
    end

  end
end
