require "rails_helper"

RSpec.describe WishItemsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/wish_items").to route_to("wish_items#index")
    end

    it "routes to #new" do
      expect(get: "/wish_items/new").to route_to("wish_items#new")
    end

    it "routes to #show" do
      expect(get: "/wish_items/1").to route_to("wish_items#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/wish_items/1/edit").to route_to("wish_items#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/wish_items").to route_to("wish_items#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/wish_items/1").to route_to("wish_items#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/wish_items/1").to route_to("wish_items#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/wish_items/1").to route_to("wish_items#destroy", id: "1")
    end
  end
end
