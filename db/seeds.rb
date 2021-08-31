# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

User.create([{
    name: 'superman',
    photo: 'https://sm.ign.com/t/ign_es/screenshot/default/publicity-photo-superman-the-movie-20409106-1054-1_8zn8.1280.jpg',
    email: 'user01@mail.com',
    password: '123123',
    password_confirmation: '123123'
},{
    name: 'batman',
    photo: 'https://media-cldnry.s-nbcnews.com/image/upload/newscms/2017_23/2033316/170610-crop-adam-west-batman-3-ew-1156a.jpg',
    email: 'user02@mail.com',
    password: '123123',
    password_confirmation: '123123'
},{
    name: 'spiderman',
    photo: 'https://i.ytimg.com/vi/6mAb29eUkBE/maxresdefault.jpg',
    email: 'user03@mail.com',
    password: '123123',
    password_confirmation: '123123'
}])

100.times do
    Tweet.create(
        content: Faker::TvShows::BojackHorseman.quote,
        user_id: rand(1..3)
    )
end

AdminUser.create!(email: 'admin@mail.com', password: '123123', password_confirmation: '123123') if Rails.env.development?