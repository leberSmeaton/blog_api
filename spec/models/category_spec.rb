require 'rails_helper'

RSpec.describe Category, type: :model do
  context "factory" do
    
    before(:all) do
      @category = build(:category)
    end

    it "has a valid factory" do
      expect(@category).to be_valid
    end

    it "has the right name" do
      expect(@category.name).to eq "Awesome Category"
    end
  end
end
