FactoryBot.define do
  factory :post do
    association :author, factory: :user
    association :category
    title { "Factories are awesome" }
    content { "FactoryBot saves me time" }
  end
end
