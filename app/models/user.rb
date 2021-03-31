class User < ApplicationRecord
    has_many :reviews 
    has_many :breweries, through: :reviews 
    has_many :bars, through: :reviews 
    has_many :beers, through: :reviews
    
    has_many :like_tables

    validates :username, uniqueness: true 

    has_secure_password
    
    validate :twenty_one_and_older

    

    
    def to_s
        self.first_name + ' ' + self.last_name
    end 

    def twenty_one_and_older
        if birthday > (Date.today - 21.years)
            errors.add(:birthday, "You must be over 21." )
        end
    end


    #like tables 
    def liked_reviews
        reviews = []
        self.like_tables.each do |relationship|
            reviews << Review.find(relationship.review_id)
        end
        return reviews
    end
end


