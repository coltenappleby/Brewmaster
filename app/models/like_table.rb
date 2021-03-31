class LikeTable < ApplicationRecord

    belongs_to :review
    belongs_to :user

    validates :user_id, presence: { message: "User is required" }
    validates :review_id, presence: { message: "Review is required" }

    validates :review_id, uniqueness: {scope: :user_id}



    def like_count
        LikeTable.count(:id)
    end
end
