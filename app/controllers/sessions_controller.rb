class SessionsController < ApplicationController

    def login
        @user = User.find_by(username: params[:session][:username])

        if @user && @user.authenticate(params[:session][:password])
            cookies[:user_id] = @user.id 
            redirect_to @user 
        else
            flash[:errors] = "Password or Username is incorrect"
            redirect_to new_login_path
        end

    end

    def logout
        cookies.delete(:user_id)

        redirect_to new_login_path 
    end
end