require 'rails_helper'

RSpec.describe Post, type: :model do
  # it "should belong to a author" do
  #   t = Post.reflect_on_association(:author) # weird syntax
  #   # t = Post.reflect_on_association(:user) changed to author in posts.rb model
  #   expect(t.macro).to eq(:belongs_to)
  # end

  context "associations" do
    it {should belong_to(:author).class_name("User")}
    it {should belong_to(:category)}
  end

  context "validations" do
    it {should validate_presence_of(:title)}
    it {should validate_presence_of(:content)}
  end
end
