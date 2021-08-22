# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

User.create([{
    name: Faker::TvShows::BojackHorseman.character,
    photo: Faker::Avatar.image,
    email: 'user01@mail.com',
    password: '123456',
    password_confirmation: '123456'
},{
    name: Faker::TvShows::BojackHorseman.character,
    photo: Faker::Avatar.image,
    email: 'user02@mail.com',
    password: '123456',
    password_confirmation: '123456'
},{
    name: Faker::TvShows::BojackHorseman.character,
    photo: Faker::Avatar.image,
    email: 'user03@mail.com',
    password: '123456',
    password_confirmation: '123456'
}])

50.times do
    Tweet.create(
        content: Faker::TvShows::BojackHorseman.quote,
        user_id: rand(1..3)
    )
end