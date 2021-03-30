class Review < ApplicationRecord
    belongs_to :user 
    belongs_to :beer 
    belongs_to :bar 

    has_many :like_tables

    validates :title, length: { maximum: 60, message: "Title must be less than 60 characters."}
    validates :rating, presence: { message: "Rating is required" }
    validates :rating, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 5 }
    validates :content, length: { minimum: 10, message: "Content must be at least 10 characters."}
    # validates :beer_id, prescence: true
    # validates :user_id, prescence: true 
    #validate the length of the title

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
