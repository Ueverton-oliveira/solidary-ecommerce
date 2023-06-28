require 'rails_helper'

RSpec.describe "Homes", type: :request do
  describe "GET /index.html.erb" do
    it "returns http success" do
      get "/home/index.html.erb"
      expect(response).to have_http_status(:success)
    end
  end

end
