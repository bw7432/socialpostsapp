require 'rails_helper'


RSpec.describe "Posts" do
  describe "GET /v1/posts" do
    it "works! (now write some real specs)" do
      get v1_posts_path
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /v1/posts" do
    it "a user create a new post" do
      user = FactoryBot.create(:user)
      post v1_posts_path, :params => { :post => {:title => "My Post Title", :body => "Post body", :user_id => user.id} }
      expect(response).to have_http_status(201)

    end
  end

end
