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
    email: 'superman@mail.com',
    password: '123123',
    password_confirmation: '123123'
},{
    name: 'batman',
    photo: 'https://illgetdrivethru.files.wordpress.com/2020/09/batman-1966.jpg?w=600',
    email: 'batman@mail.com',
    password: '123123',
    password_confirmation: '123123'
},{
    name: 'spiderman',
    photo: 'https://i.ytimg.com/vi/6mAb29eUkBE/maxresdefault.jpg',
    email: 'spiderman@mail.com',
    password: '123123',
    password_confirmation: '123123'
},{
    name: 'wonder_woman',
    photo: 'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d8/Lynda_Carter_Wonder_Woman.JPG/245px-Lynda_Carter_Wonder_Woman.JPG',
    email: 'wonder_woman@mail.com',
    password: '123123',
    password_confirmation: '123123'
},{
    name: 'de_ameizing_ezpiderman',
    photo: 'https://i.ytimg.com/vi/69tTYWDJdP8/maxresdefault.jpg',
    email: 'ezpyderman@mail.com',
    password: '123123',
    password_confirmation: '123123'}])


300.times do
    Tweet.create(
        content: Faker::TvShows::BojackHorseman.quote,
        user_id: rand(1..5)
    )
end

AdminUser.create!(email: 'admin@mail.com', password: '123123', password_confirmation: '123123') #if Rails.env.development?