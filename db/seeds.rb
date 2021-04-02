# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'faker'

User.destroy_all
Brewery.destroy_all
Beer.destroy_all
Bar.destroy_all
Review.destroy_all
BeerMenu.destroy_all

brewery_type = ["micro-brewery", "mid-size", "macro-brewery", "homebrewer", "bathtub", "domestic", "import"]

1..20.times do
    User.create(
        username: Faker::Games::SuperMario.character,
        hometown: Faker::Games::SuperMario.location,
        birthday: Faker::Date.between(from: '1990-01-01', to: '2005-12-31'),
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        password: Faker::Construction.material    )
end



1..2000.times do
    Brewery.create(
        name: Faker::Beer.brand,
        city: Faker::Games::Pokemon.location,
        style: brewery_type.sample
    )
end



1..20.times do
    Bar.create(
        name: Faker::Restaurant.name,
        city: Faker::Games::Pokemon.location
    )
end

# 1..100.times do
#     Review.create(
#         user_id: User.all.sample.id,
#         beer_id: Beer.all.sample.id,
#         bar_id: Bar.all.sample.id,
#         rating: rand(1..5),
#         title: Faker::Science.element,
#         content: Faker::Movies::StarWars.wookiee_sentence
#     )
# end

# 1..100.times do
#     BeerMenu.create(
#         bar_id: Bar.all.sample.id,
#         beer_id: Beer.all.sample.id
#     )
# end

#################################################################
require 'csv'



breweries_csv = []
CSV.foreach('lib/Breweries.csv', headers: true) do |row|
    breweries_csv << row.to_h
end

breweries_csv.each do |brewery|
    brewery[:style] = brewery_type.sample
end

breweries_csv.each do |brewery|
    if !brewery.key?(:city)
        brewery[:city] = Faker::Games::Pokemon.location
    end
end

#Brewery.import breweries_csv

beers_csv = []
CSV.foreach('lib/Beers2.csv', headers: true) do |row|
    beers_csv << row.to_h
end

Beer.import beers_csv


