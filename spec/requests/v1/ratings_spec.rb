require 'rails_helper'

RSpec.describe "Ratings", type: :request do
  describe "GET /v1/ratings" do
    it "works! (now write some real specs)" do
      get v1_ratings_path
      expect(response).to have_http_status(200)
    end
  end
end
