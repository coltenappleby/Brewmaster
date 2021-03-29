class Bar < ApplicationRecord
    has_many :reviews 
    has_many :beers, through: :reviews 
    has_many :users, through: :reviews 
    has_many :beer_menus
end
