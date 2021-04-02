class ReviewsController < ApplicationController

    before_action :authorized
    
    def show
        logged_in_user
        find_review
    end

    def new 

        @current_user = User.find_by(id: cookies[:user_id])
 

        @review = Review.new

        @users = User.all 
        @bars = Bar.all
        @beers = Beer.all 

    end

    def create
        @review = Review.create(review_params(:user_id, :title, :content, :beer_id, :bar_id, :rating)) 
        
        if @review.valid?
            redirect_to review_path(@review.id)
        else
            #flash[:errors] = flash.errors.full_messages
            # render :new 
            #redirect_to beer_path(params[:beer_id])

            redirect_to request.referrer
        end
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

    def destroy
        find_review 
        @review.destroy 
        redirect_to user_path(@current_user)
    end

    private 

    def review_params(*args)
        params.require(:review).permit(*args)
    end

    def find_review
        @review = Review.find(params[:id])
    end

    def current_user_instance
        @current_user = User.find_by(id: cookies[:user_id])
    end


end
