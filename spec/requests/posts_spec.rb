require 'rails_helper'

RSpec.describe "Posts", type: :request do
  describe "GET /posts" do
    before(:all) do
      create(:post)
    end

    before(:each) do 
      get "/posts"
    end

    it "should respond with 200 ok" do
      expect(response).to have_http_status(200)
    end

    it "should respond with json" do
      expect(response.content_type).to eq("application/json; charset=utf-8")
    end

    it "should respond with included category Awesome Category" do
      expect(response.body).to include("Awesome Category")
    end

    it "should respond with included factory content" do
      expect(response.body).to include("FactoryBot saves me time")
    end
    
  end
end
