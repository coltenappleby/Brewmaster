class User < ApplicationRecord
    has_many :reviews 
    has_many :breweries, through: :reviews 
    has_many :bars, through: :reviews 
    has_many :beers, through: :reviews 

    
end
