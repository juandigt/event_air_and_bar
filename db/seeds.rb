puts "Creating a user"

Space.destroy_all
User.destroy_all

u = User.create!(email: "test@test.com", password: "123456")
v = User.create!(email: "test@secondtest.com", password: "123456")
w = User.create!(email: "test@thirdtest.com", password: "123456")



puts "Creating spaces..."

Space.create!(
  name: "Wonderful space with view over Barcelona",
  description: "Event space downtown with a 360 degrees view over Barcelona.",
  address: "Rambla del Raval, 17-21, 08001 Barcelona, Spain",
  capacity: 5,
  price: 500,
  user: u
)
Space.create!(
  name: "Nice place for majestic events",
  description: "Majestic Events has been created for you to enjoy the best we have to offer.",
  address: "Passeig de Gràcia 68, 08007, Barcelona, Spain",
  capacity: 5,
  price: 5000,
  user: u
)
Space.create!(
  name: "Maria Elena Place - the number one in Madrid",
  description: "Maria Elena Palace is certainly one of the best value hotels in town. It is located in the very center of Madrid, just 300m from Puerta del Sol and offers very good connections to every corner of the town.",
  address: "Maria Elena Place, Calle Aduana 19, Madrid, Spain",
  capacity: 5,
  price: 2500,
  user: v
)
Space.create!(
  name: "Host your event here",
  description: "If you are looking for a city centered spot with a big capacity, you are at the right place.",
  address: "Allied London, 33 Cork Street, London, Great Britain",
  capacity: 5,
  price: 1500,
  user: w
)
Space.create!(
  name: "Enjoy your event in an aviation atmosphere",
  description: "A highly modern atmosphere in the world of aviation awaits you in the Lufthansa training centre",
  address: "Frankfurt Aviation Campus, Airportring Tor 24, 60549 Frankfurt am Main, Germany",
  capacity: 5,
  price: 500,
  user: v
)
Space.create!(
  name: "Enjoy your event in an aviation atmosphere",
  description: "A highly modern atmosphere in the world of aviation awaits you in the Lufthansa training centre.",
  address: "Vienna Aviation Campus, Austrian Airlines Base, 1300 Vienna Airport, Austria",
  capacity: 5,
  price: 300,
  user: v
)

puts 'Finished!'
