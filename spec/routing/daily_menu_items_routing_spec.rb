require "rails_helper"

RSpec.describe DailyMenuItemsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/daily_menu_items").to route_to("daily_menu_items#index")
    end

    it "routes to #new" do
      expect(get: "/daily_menu_items/new").to route_to("daily_menu_items#new")
    end

    it "routes to #show" do
      expect(get: "/daily_menu_items/1").to route_to("daily_menu_items#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/daily_menu_items/1/edit").to route_to("daily_menu_items#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/daily_menu_items").to route_to("daily_menu_items#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/daily_menu_items/1").to route_to("daily_menu_items#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/daily_menu_items/1").to route_to("daily_menu_items#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/daily_menu_items/1").to route_to("daily_menu_items#destroy", id: "1")
    end
  end
end
