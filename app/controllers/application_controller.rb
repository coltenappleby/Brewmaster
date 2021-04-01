class ApplicationController < ActionController::Base
    before_action :logged_in_user
    # before_action :authorized

    def logged_in_user
        @current_user = User.find_by(id: cookies[:user_id])
    end

    def logged_in?
        !logged_in_user.nil?
    end

    def authorized
        redirect_to new_login_path unless logged_in?
    end

    
end
