require 'rails_helper'

RSpec.describe "Auths", type: :request do

  describe "POST /auth/login" do

    before(:all) do
      @user = create(:user)
    end
  
    context "with correct credentials" do

      before(:each) do
        post "/auth/login", params: {auth: {email: "test@testing.com", password: "password1"}}
      end
      
      it "should return 200 okay" do
        expect(response).to have_http_status(200)
      end

      it "should include a jwt and a username" do
        expect(response.body).to include("jwt")
        expect(response.body).to include("MrTest")
      end

      context "with incorrect credentials" do
        before(:each) do
          post "/auth/login", params: {auth: {email: "test@testing.com", password: "passwo"}}
        end
        
        it "should return 422 unprocessable" do
          expect(response).to have_http_status(422)
        end

        it "should include an error message" do
          expect(response.body).to include("Incorrect email or password")
        end
      end
    end
  end
  
  describe "POST /auth/register" do  
    context "with valid details" do
    
      before(:all) do
        @user_count = User.count
      end

      before(:each) do
        post "/auth/register", params: {auth: {email: "test1@testing.com", username: "NewUser", password: "password", password_confirmation: "password"}}
      end

      it "should return 201 created" do
        expect(response).to have_http_status(201)
      end

      it "should include a jwt and username" do
        expect(response.body).to include("jwt")
        expect(response.body).to include("NewUser")
      end

      it "should increase user count" do
        expect(User.count).to eq(@user_count +1)
      end
    end
  end
end
