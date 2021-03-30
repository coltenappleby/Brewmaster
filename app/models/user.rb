class User < ApplicationRecord
    has_many :reviews 
    has_many :breweries, through: :reviews 
    has_many :bars, through: :reviews 
    has_many :beers, through: :reviews 

    validates :username, uniqueness: true 
    validate :twenty_one_and_older

    
    def to_s
        self.first_name + ' ' + self.last_name
    end 

    def twenty_one_and_older

       

        if birthday > (Date.today - 21.years)
            errors.add(:birthday, "You must be over 21." )
        end


    end
end
