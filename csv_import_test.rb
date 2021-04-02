require 'csv'
require 'faker'
require 'pry'

brewery_type = ["micro-brewery", "mid-size", "macro-brewery", "homebrewer", "bathtub", "domestic", "import"]


breweries_csv = []
CSV.foreach('lib/Breweries.csv', headers: true) do |row|
    breweries_csv << row.to_h
end
binding.pry

breweries_csv.each do |brewery|
    brewery["style"] = brewery_type.sample
end

breweries_csv.each do |brewery|
    if brewery["city"] == nil
        brewery["city"] = Faker::Games::Pokemon.location
    end
end

# breweries_csv.each do |brewery|
#     if brewery["name"] == nil
#        puts brewery
#     end
# end

#Brewery.import breweries_csv

beers_csv = []
CSV.foreach('lib/Beers2.csv', headers: true) do |row|
    beers_csv << row.to_h
end

beer1 = beers_csv[0]

beer1.each do |key, value|
    puts "#{key} == #{value}"
end 
binding.pry
#Beer.import beers_csv

