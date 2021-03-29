class Review < ApplicationRecord
    belongs_to :user 
    belongs_to :beer 
    belongs_to :bar 

    def find_author
        User.where(id: self.user_id).first.username
    end

    def find_bar
        Bar.where(id: self.bar_id).first.name
    end

    def find_beer
        Beer.where(id: self.beer_id).first.name 
    end
        
   
end
