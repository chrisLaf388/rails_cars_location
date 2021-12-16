require "open-uri"
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
user = User.create(email: "julien@gmail.com", password: "azerty")

file = URI.open("https://images.pexels.com/photos/210019/pexels-photo-210019.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260")
file2 =  URI.open("https://images.pexels.com/photos/170811/pexels-photo-170811.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260")
file3 =  URI.open("https://images.pexels.com/photos/1592384/pexels-photo-1592384.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260")

car1 = Car.create!(name: "Ferrari",
          category: "Sportscar",
          horse_power: 30,
          price_per_day: 50,
          transmision: "automatique",
          energy: "Essence",
          year_circulation: 2017,
          city: "Marseille",
          user: user).photo.attach(io: file, filename: 'car1.jpeg',content_type: 'image/jpeg')


car2 = Car.new(name: "Porsh",
          category: "Sportscar",
          horse_power: 22,
          price_per_day: 60,
          transmision: "automatique",
          energy: "Essence",
          year_circulation: 2015,
          city: "Marseille",
          user: user)

          car2.photo.attach(io: file2, filename: 'car2.jpeg', content_type: 'image/jpeg')
          car2.save!

car3 = Car.new(name: "Twingo",
          category: "City Car",
          horse_power: 4,
          price_per_day: 10,
          transmision: "manuelle",
          energy: "Essence",
          year_circulation: 1991,
          city: "Marseille",
          user: user)

          car3.photo.attach(io: file3, filename: 'car3.jpeg', content_type: 'image/jpeg')
          car3.save!

Booking.create!(start_at: Date.new(2001,2,3), end_at: Date.new(2001,4,5), total_price: 50, user: user, car: car2)
Booking.create!(start_at: Date.new(2002,2,3), end_at: Date.new(2004,4,5), total_price: 70, user: user, car: car3)

puts "End of the Seeds"
