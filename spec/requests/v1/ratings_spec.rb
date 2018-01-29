require 'rails_helper'

RSpec.describe "Ratings", type: :request do

  describe "POST /v1/ratings" do
    it "a user create a new rating" do
      user = FactoryBot.create(:user)
      rater = FactoryBot.create(:user)
      post v1_ratings_path, :params => { :rating => {:user_id => user.id, :rater_id => rater.id, :rating => 4} }
      expect(response).to have_http_status(201)
    end
  end

  describe "POST /v1/ratings" do
    it "a user cannot rate a user twice" do
      user = FactoryBot.create(:user)
      rater = FactoryBot.create(:user)
      rating = FactoryBot.create(:rating, user: user, rater_id: rater.id)
      post v1_ratings_path, :params => { :rating => {:user_id => user.id, :rater_id => rater.id, :rating => 4} }
      expect(response).to have_http_status(200)
    end
  end
end
