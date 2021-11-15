class Post < ApplicationRecord
  belongs_to :author, class_name: "User", foreign_key: "user_id"
  # can change name but still referred to user model
  # belongs_to :user, class_name: "User", foreign_key: "user_id"
  belongs_to :category
  validates :title, presence: true
  validates :content, presence: true
end
