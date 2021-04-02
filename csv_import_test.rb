require 'csv'
require 'faker'
require 'pry'

brewery_type = ["micro-brewery", "mid-size", "macro-brewery", "homebrewer", "bathtub", "domestic", "import"]


breweries_csv = []
CSV.foreach('lib/Breweries.csv', headers: true) do |row|
    breweries_csv << row.to_h
end

breweries_csv.each do |brewery|
    if brewery["city"] == nil
        brewery["city"] = Faker::Games::Pokemon.location
        puts brewery["name"]
    end
end

breweries_csv = breweries_csv.each { |h| h.delete_if{|key,value| value == nil}}

breweries_csv.each do |brewery|
    brewery[:style] = brewery_type.sample
end



brewery1 = breweries_csv[0]

brewery1.each do |key, value|
    puts "#{key} == #{value}"
end 

# binding.pry

#Brewery.import breweries_csv
##################################
beers_csv = []

CSV.foreach('lib/Beers2.csv', headers: true) do |row|
    beers_csv << row.to_h
end

beers_csv = beers_csv.each { |h| h.delete_if{|key,value| value == nil}}

beer1 = beers_csv[0]

beer1.each do |key, value|
    puts "#{key} == #{value}"
end 
binding.pry
# #Beer.import beers_csv

