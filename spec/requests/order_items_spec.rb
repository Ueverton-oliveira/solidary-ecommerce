require 'rails_helper'

RSpec.describe "OrderItems", type: :request do
  describe "GET /show" do
    it "returns http success" do
      get "/order_items/show"
      expect(response).to have_http_status(:success)
    end
  end

end
