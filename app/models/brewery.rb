class Brewery < ApplicationRecord
    has_many :beers 
    has_many :reviews, through: :beers 


    def brew_avg_rating
        rat = self.reviews.sum(:rating)/(self.reviews.count().to_f)
        rat.round(2)
    end

end
