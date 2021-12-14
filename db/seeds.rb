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
User.create!(email: "julien@gmail.com", password: "azerty")
file = URI.open("https://images.pexels.com/photos/210019/pexels-photo-210019.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260")
file2 =  URI.open("https://images.pexels.com/photos/170811/pexels-photo-170811.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260")
file3 =  URI.open("https://images.pexels.com/photos/1592384/pexels-photo-1592384.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260")

Car.create!(name: "Ferrari",
          category: "Sportive",
          horse_power: 30,
          price_per_day: 50,
          transmision: "automatique",
          energy: "Essence",
          year_circulation: 2017,
          city: "Marseille",
          user_id: User.all.last.id).photo.attach(io: file, filename: 'car1.jpeg',content_type: 'image/jpeg')

Car.create!(name: "Porsh",
          category: "Sportive",
          horse_power: 22,
          price_per_day: 60,
          transmision: "automatique",
          energy: "Essence",
          year_circulation: 2015,
          city: "Marseille",
          user_id: User.all.last.id).photo.attach(io: file2, filename: 'car2.jpeg', content_type: 'image/jpeg')

Car.create!(name: "Twingo",
          category: "Citadine",
          horse_power: 4,
          price_per_day: 10,
          transmision: "manuelle",
          energy: "Essence",
          year_circulation: 1991,
          city: "Marseille",
          user_id: User.all.last.id).photo.attach(io: file3, filename: 'car3.jpeg', content_type: 'image/jpeg')


 Booking.create!(start_at: Date.new(2001,2,3), end_at: Date.new(2001,4,5), total_price: 50, user_id: User.all.last.id, car_id: Car.all.last.id)
 Booking.create!(start_at: Date.new(2002,2,3), end_at: Date.new(2004,4,5), total_price: 70, user_id: User.all.last.id, car_id: Car.all.first.id)

puts "End of the Seeds"
