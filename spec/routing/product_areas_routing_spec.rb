require "rails_helper"

RSpec.describe ProductAreasController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/product_areas").to route_to("product_areas#index")
    end

    it "routes to #new" do
      expect(:get => "/product_areas/new").to route_to("product_areas#new")
    end

    it "routes to #show" do
      expect(:get => "/product_areas/1").to route_to("product_areas#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/product_areas/1/edit").to route_to("product_areas#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/product_areas").to route_to("product_areas#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/product_areas/1").to route_to("product_areas#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/product_areas/1").to route_to("product_areas#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/product_areas/1").to route_to("product_areas#destroy", :id => "1")
    end

  end
end
