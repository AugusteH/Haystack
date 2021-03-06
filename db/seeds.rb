# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


10.times { Client.create(name: Faker::Company.name) }

Client.last(10).each do |client|
  3.times { Product.create(name: Faker::Pokemon.name + ' ' + Faker::StarWars.specie, price: rand(9999), description: Faker::Hipster.sentence, client_id: client.id) }
end
