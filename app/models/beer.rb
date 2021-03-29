class Beer < ApplicationRecord
    has_many :reviews 
    has_many :users, through: :reviews
    has_many :bars, through: :reviews
    has_many :beer_menus 
    belongs_to :brewery 


    def brewery_name
        Brewery.where(id: self.brewery_id).first.name
    end

    def list_of_reviews
        self.reviews
    end

    def avg_rating
        self.reviews.sum(:rating)/(self.reviews.count().to_f)
    end
end
