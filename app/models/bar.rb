class Bar < ApplicationRecord
    has_many :reviews 
    has_many :beers, through: :reviews 
    has_many :users, through: :reviews 
    has_many :beer_menus

    # def beer_list
    #     Beer.where(id: @beer.id)
    # end
# #in html 
#     2.6.1 :002 > Bar.first.beers.each do |beer|
#         2.6.1 :003 >     beer.name
#         2.6.1 :004?>   end
end
