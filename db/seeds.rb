# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "seeds beginning !!! "

Car.create(name: "Ferrari",
          category: "Sportive",
          horse_power: 30,
          price_per: 50,
          transmision: "automatique",
          energy: "Essence",
          year_circulation: 2017,
          city: "Marseille")

Car.create(name: "Porsh",
          category: "Sportive",
          horse_power: 22,
          price_per: 60,
          transmision: "automatique",
          energy: "Essence",
          year_circulation: 2015,
          city: "Marseille")

Car.create(name: "Twingo",
          category: "Citadine",
          horse_power: 4,
          price_per: 10,
          transmision: "manuelle",
          energy: "Essence",
          year_circulation: 1991,
          city: "Marseille")

puts "end of the Seeds"
