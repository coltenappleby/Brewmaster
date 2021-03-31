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

    # validate :current_user_only

    def find_author
        User.where(id: self.user_id).first.username
    end

    def find_bar
        Bar.where(id: self.bar_id).first.name
    end

    def find_beer
        Beer.where(id: self.beer_id).first.name 
    end

    # def current_user_only
    #     current_user_instance
    #     if user_id !=  @current_user.id #cookies[:user_id]
    #         errors.add(:user_id, "You must be logged in." )
    #     end
    # end

    def likes
        LikeTable.where(review_id: self.id).count()
    end

    # def twenty_one_and_older
    #     if birthday > (Date.today - 21.years)
    #         errors.add(:birthday, "You must be over 21." )
    #     end
    # end

   
end
