class ReviewsController < ApplicationController
    
    def show
        @review = Review.find(params[:id])
    end

    def new 
        @review = Review.new

        @users = User.all 
        @bars = Bar.all
        @beers = Beer.all 

    end

    def create
        @review = Review.create(review_params(:user_id, :title, :content, :beer_id, :bar_id, :rating)) 

        redirect_to review_path(@review.id)
        #come back to deal with validations
    end

    private 

    def review_params(*args)
        params.require(:review).permit(*args)
    end
end
