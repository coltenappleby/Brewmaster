class User < ApplicationRecord
    has_many :reviews 
    has_many :breweries, through: :reviews 
    has_many :bars, through: :reviews 
    has_many :beers, through: :reviews 

    
    def to_s
        self.first_name + ' ' + self.last_name
    end 
end
