# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Start seeding"

puts "Cleanup"
Flat.destroy_all

5.times do |index|
  puts "Creating new flat"
    Flat.create(
      name: Faker::Address.street_name,
      address: Faker::Address.full_address,
      description: Faker::Lorem.paragraph,
      price_per_night: (75..350).to_a.sample,
      number_of_guests: (1..8).to_a.sample
    )
end
