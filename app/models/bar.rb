class Bar < ApplicationRecord
    has_many :reviews 
    has_many :beers, through: :reviews 
    has_many :users, through: :reviews 
    has_many :beer_menus

    def beer_list
        beers = []
        self.beer_menus.each do |relationship|
            beers << Beer.find(relationship.beer_id)
        end
        return beers

        # beer_ids = []
        # self.beer_menus.each do |relationship|
        #     beer_ids << relationship.beer_id
        # end
        # Beer.find(beer_ids)
    end

# #in html 
#     2.6.1 :002 > Bar.first.beers.each do |beer|
#         2.6.1 :003 >     beer.name
#         2.6.1 :004?>   end
end
