require 'rails_helper'

RSpec.describe "Events", type: :request do
  describe "GET /v1/events" do
    it "works! (now write some real specs)" do
      get v1_events_path
      expect(response).to have_http_status(200)
    end
  end
end
