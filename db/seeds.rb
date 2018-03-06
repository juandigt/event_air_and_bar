puts "Creating a user"

Space.destroy_all
User.destroy_all

u = User.create!(email: "test@test.com", password: "123456")
v = User.create!(email: "test@secondtest.com", password: "123456")
w = User.create!(email: "test@thirdtest.com", password: "123456")



puts "Creating spaces..."

Space.create!(
  name: "wonderful space",
  description: "event space downtown",
  address: "Ramblas, Barcelona",
  capacity: 5,
  price: 500,
  user: u
)
Space.create!(
  name: "nice place for events",
  description: "in the nice area",
  address: "Ramblas, Barcelona",
  capacity: 5,
  price: 5000,
  user: u
)
Space.create!(
  name: "number one in town",
  description: "whatever and ever and ever",
  address: "Ramblas, Granada",
  capacity: 5,
  price: 2500,
  user: v
)
Space.create!(
  name: "host your event here",
  description: "Yes, do it",
  address: "Ramblas, Copenhagen",
  capacity: 5,
  price: 1500,
  user: v
)
Space.create!(
  name: "looking for an alternative space?",
  description: "for open minde people",
  address: "Ramblas, NYC",
  capacity: 5,
  price: 500,
  user: v
)
Space.create!(
  name: "mediterrean event place",
  description: "event space at the sea",
  address: "Ramblas, Vienna",
  capacity: 5,
  price: 300,
  user: w
)


puts 'Finished!'
