require 'rails_helper'

RSpec.describe "Categories", type: :request do
  describe "GET /categories" do
    before(:each) do
      create(:category)
    end
    
    before(:each) do # hook and describe block
      get "/categories"
    end

    it "should respond with 200 ok" do
      expect(response).to have_http_status(200)
    end

    it "should respond with json" do
      expect(response.content_type).to eq("application/json; charset=utf-8")
    end

    it "should include my default factory category Awesome Category" do
      expect(response.body).to include("Awesome Category")
    end

    # it "should include code" do
      # expect(response.body).to include("code")
    # end
  end
end
