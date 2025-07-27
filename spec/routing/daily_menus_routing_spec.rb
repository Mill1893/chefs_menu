require "rails_helper"

RSpec.describe DailyMenusController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/daily_menus").to route_to("daily_menus#index")
    end

    it "routes to #new" do
      expect(get: "/daily_menus/new").to route_to("daily_menus#new")
    end

    it "routes to #show" do
      expect(get: "/daily_menus/1").to route_to("daily_menus#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/daily_menus/1/edit").to route_to("daily_menus#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/daily_menus").to route_to("daily_menus#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/daily_menus/1").to route_to("daily_menus#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/daily_menus/1").to route_to("daily_menus#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/daily_menus/1").to route_to("daily_menus#destroy", id: "1")
    end
  end
end
