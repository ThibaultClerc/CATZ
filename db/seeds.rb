# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
Faker::Config.locale = 'fr'

10. times do
  Item.create!(
    title: Faker::Hipster.sentence,
    description: Faker::Hipster.paragraph,
    price: rand(20..100),
    image_url: "http://www.catsinsinks.com/cats/rotator.php"
  )
end

puts "#{Item.all.count} photos de chats créées"

puts "SEED DONE"