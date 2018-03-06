# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



Space.destroy_all

puts "Creating spaces..."

Space.create(name: "wonderful space", description: "event space downtown", address: "Ramblas, Barcelona", capacity: 5, price: 500)
Space.create(name: "nice place for events", description: "in the nice area", address: "Ramblas, Barcelona", capacity: 5, price: 5000)
Space.create(name: "number one in town", description: "whatever and ever and ever", address: "Ramblas, Granada", capacity: 5, price: 2500)
Space.create(name: "host your event here", description: "Yes, do it", address: "Ramblas, Copenhagen", capacity: 5, price: 1500)
Space.create(name: "looking for an alternative space?", description: "for open minde people", address: "Ramblas, NYC", capacity: 5, price: 500)
Space.create(name: "mediterrean event place", description: "event space at the sea", address: "Ramblas, Vienna", capacity: 5, price: 300)


puts 'Finished!'
