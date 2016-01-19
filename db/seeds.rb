# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
users_attrs = [
  {email: "user@example.com", password: "password", password_confirmation: "password", username: "The best user"},
  {email: "lunk@example.com", password: "password", password_confirmation: "password", username: "Lunk"},
  {email: "zorldo@example.com", password: "password", password_confirmation: "password", username: "Zorldo"},
]

User.create!(users_attrs)
Relationship.create(
    follower_id: User.find_by_username("The best user").id,
    followed_id: User.find_by_username("Zorldo").id
)

200.times do
  Post.create!(user_id: rand(1..3), content: Faker::Hipster.sentence)
end
