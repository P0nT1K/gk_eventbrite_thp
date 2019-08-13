# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
User.destroy_all
User.reset_pk_sequence
Event.destroy_all
Event.reset_pk_sequence
Attendance.destroy_all
Attendance.reset_pk_sequence
10.times do
    u = User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, description: Faker::ChuckNorris.fact, email: Faker::Internet.email, password: 1234567, password_confirmation: 1234567)
end

10.times do 
    e = Event.create(start_date: Faker::Date.forward(days: 23), duration: 120 , title: Faker::Lorem.sentence(word_count: 3),  description: Faker::Lorem.paragraph(sentence_count: 2), price: 10 , location: Faker::Address.community, administrator: User.all.sample)
end

20.times do
    Attendance.create(participant: User.all.sample, event: Event.all.sample, strip_customer_id: rand(1..100))
end

