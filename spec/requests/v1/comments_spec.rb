require 'rails_helper'

RSpec.describe "Comments", type: :request do
  describe "GET /v1/comments" do
    it "works! (now write some real specs)" do
      get v1_comments_path
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /v1/comments" do
    it "a user create a new post" do
      user = FactoryBot.create(:user)
      post = FactoryBot.create(:post)
      post v1_comments_path, :params => { :comment => {:message => "My message", :post_id => post.id, :user_id => user.id} }
      expect(response).to have_http_status(201)

    end
  end
end
