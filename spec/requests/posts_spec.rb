require 'rails_helper'

RSpec.describe "Posts", type: :request do
  before(:all) do
    create(:post)
  end
  
  describe "GET /posts" do

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

  describe "GET /posts/:id" do

    context "valid post id" do
      before(:each) do 
        get "/posts/1"
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

    context "invalid post id" do
      before(:each) do 
        get "/posts/2"
      end

      it "should respond with 404 ok" do
        expect(response).to have_http_status(404)
      end

      it "should respond with json" do
        expect(response.content_type).to eq("application/json; charset=utf-8")
      end

      it "should respond with an error" do
        expect(response.body).to include("Unable to find post")
      end
    end

  end
end
