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
    title:       Faker::Hipster.sentence,
    description: Faker::Hipster.paragraph,
    price:       rand(20..100),
    image_url:   "http://www.catsinsinks.com/cats/rotator.php"
  )
end

puts "#{Item.all.count} photos de chats créées"

5.times do
  User.create!(
    email:     Faker::Internet.email,
    password:   "azerty",
    first_name: Faker::Name.first_name,
    last_name:  Faker::Name.last_name
  )
end

puts "#{User.all.count} users created"

i=1
5.times do
  Cart.create!(
    user_id: i
  )
  i+=1
end

puts "#{Cart.all.count} carts created"

j=1
5.times do
  JoinTableItemCart.create!(
    cart_id: j,
    item_id: j
  )
  j+=1
end

puts "#{JoinTableItemCart.all.count} join_table_item_carts created"


puts "SEED DONE"
