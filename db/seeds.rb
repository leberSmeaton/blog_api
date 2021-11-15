# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

if User.count == 0 
  User.create(username: "Alex", email: "alex@test.com", password: "password1", password_confirmation: "password1")
  puts "created user"
end

if Category.count == 0 
  categories = ["code", "health", "movies", "hobbies", "entertainment", "food"]
  categories.each do |category| 
      Category.create(name: category)
  end
  puts "Created categories"
end

if Post.count == 0 
  15.times do 
      author = User.first
      Post.create(
          author: author, 
          title: Faker::Lorem.words(number: 3).join(" "),
          content: Faker::Lorem.paragraph_by_chars(number: 2000, supplemental: false),
          category_id: rand(5) + 1
      )
  end
  puts "created posts"
end