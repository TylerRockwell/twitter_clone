# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(email: "user@example.com", password: "password",
  password_confirmation: "password")

User.create!(email: "lunk@example.com", password: "password",
  password_confirmation: "password")

User.create!(email: "zorldo@example.com", password: "password",
  password_confirmation: "password")


200.times do
  Post.create!(user_id: rand(1..3), content: Faker::Hipster.sentence)
end
