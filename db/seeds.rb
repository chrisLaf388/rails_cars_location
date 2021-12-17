require "open-URI"
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "destroy seed ! "
Booking.destroy_all
Car.destroy_all
User.destroy_all
puts "seeds beginning !!! "


i = 0
while i < 10
  User.create(email: "julien#{i}@gmail.com", password: "azerty")
  i += 1
end

NAME = ["Ferrari", "Alfa Romeo", "Renault", "Peugeot", "FIAT", "Range Rover"]
CATEGORY = ["Sportscar", "City Car", "Sedan", "All Natural", "Supercar", "SUV"]
HP = (80..600).to_a
PRICE = (25..200).to_a
TRANSMISION = ["Automatic", "Manual", "Assisted"]
ENERGY = ["Petrol", "Diesel", "Electrical", "Hybrid", "Renewable"]
YEAR = (2002..2021).to_a
CITY = ["Marseille", "La Ciotat", "Aubagne", "Nice", "Toulon"]

files = [
  URI.open("https://images.pexels.com/photos/210019/pexels-photo-210019.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260"),
  URI.open("https://images.pexels.com/photos/170811/pexels-photo-170811.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260"),
  URI.open("https://images.pexels.com/photos/1592384/pexels-photo-1592384.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260"),
  URI.open("https://images.pexels.com/photos/120049/pexels-photo-120049.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
  URI.open("https://images.pexels.com/photos/1149831/pexels-photo-1149831.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
  URI.open("https://images.pexels.com/photos/337909/pexels-photo-337909.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
  URI.open("https://images.pexels.com/photos/241316/pexels-photo-241316.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
  URI.open("https://images.pexels.com/photos/1149137/pexels-photo-1149137.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
  URI.open("https://images.pexels.com/photos/39855/lamborghini-brno-racing-car-automobiles-39855.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
  URI.open("https://images.pexels.com/photos/1149137/pexels-photo-1149137.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
  URI.open("https://images.pexels.com/photos/3311574/pexels-photo-3311574.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
  URI.open("https://images.pexels.com/photos/831475/pexels-photo-831475.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
  URI.open("https://images.pexels.com/photos/248687/pexels-photo-248687.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
  URI.open("https://images.pexels.com/photos/244206/pexels-photo-244206.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
  URI.open("https://images.pexels.com/photos/909907/pexels-photo-909907.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500")
]


j = 0
while j < 15
  car = Car.new(name: NAME.sample,
          category: CATEGORY.sample,
          horse_power: HP.sample,
          price_per_day: PRICE.sample,
          transmision: TRANSMISION.sample,
          energy: ENERGY.sample,
          year_circulation: YEAR.sample,
          city: CITY.sample,
          user: User.all.sample)
          car.save!

  filename = files[j]
  p filename
  car.photo.attach(io: file, filename: filename, content_type: 'image/jpeg')
  j += 1
end

# car2 = Car.new(name: "Porsh",
#           category: "Sportscar",
#           horse_power: 22,
#           price_per_day: 60,
#           transmision: "automatique",
#           energy: "Essence",
#           year_circulation: 2015,
#           city: "Marseille",
#           user: user)

#           car2.photo.attach(io: file2, filename: 'car2.jpeg', content_type: 'image/jpeg')
#           car2.save!

# car3 = Car.new(name: "Twingo",
#           category: "City Car",
#           horse_power: 4,
#           price_per_day: 10,
#           transmision: "manuelle",
#           energy: "Essence",
#           year_circulation: 1991,
#           city: "Marseille",
#           user: user)

#           car3.photo.attach(io: file3, filename: 'car3.jpeg', content_type: 'image/jpeg')
#           car3.save!

Booking.create!(start_at: Date.new(2001,2,3), end_at: Date.new(2001,4,5), total_price: 50, user: User.all.sample, car: Car.all.sample)
Booking.create!(start_at: Date.new(2002,2,3), end_at: Date.new(2004,4,5), total_price: 70, user: User.all.sample, car: Car.all.sample)

puts "End of the Seeds"
