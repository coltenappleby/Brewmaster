class UsersController < ApplicationController
    
    before_action :authorized
    
    def show
        find_user
        logged_in_user                 
    end

    def new
        @user = User.new
    end
    
    def create
        @user = User.create(user_params(:username, :first_name, :last_name, :birthday, :hometown, :password))
        if @user.valid?
            cookies[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            # flash[:errors] = flash.errors.full_messages
            render :new
        end
    end

    def edit
        find_user
        render :edit
    end

    def update
        find_user 
        @user.update(user_params(:username, :hometown))

        redirect_to user_path(@user)
    end
    

    private

    def user_params(*args) #don't want to allow user to change birthday
        params.require(:user).permit(*args)
    end

    def find_user
        @user = User.find(params[:id])
    end
end
