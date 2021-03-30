class ReviewsController < ApplicationController
    
    def show
        find_review
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

    def edit
        find_review 
        render :edit 
    end

    def update
        find_review
        @review.update(review_params(:title, :rating, :content))
        
        redirect_to review_path(@review)

    end

    private 

    def review_params(*args)
        params.require(:review).permit(*args)
    end

    def find_review
        @review = Review.find(params[:id])
    end


end
