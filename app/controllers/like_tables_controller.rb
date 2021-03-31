class LikeTablesController < ApplicationController

    # def new
    #     @like_instance = LikeTable.new
    # end

    # def create
    #     @like_instance = LikeTable.create(user_id: logged_in_user.id)

    #     # if @like_instance.valid?
    #     #     redirect_to review_path(@review.id)
    #     # else
    #     #     render :new
    #     # end
    # end


    before_action :find_review
    before_action :logged_in_user


    def create
        #@current_review.like_tables.create(user_id: @current_user)
        @like_instance = LikeTable.create(user_id: @current_user.id, review_id: @current_review.id)
        
        redirect_to review_path(@current_review.id)
        
        # if @like_instance.valid?
        #     redirect_to review_path(@current_review.id)
        # else
        #     render :new
        # end
    end

    private
        def find_review
            @current_review = Review.find(params[:review_id])
        end
end

