class SessionsController < ApplicationController
    def home 
    end
    def destroy
        session.clear 
        redirect_to root_path
    end

    def new 
        redirect_to user_path(current_user) if logged_in?
    end

    def create 
        user = User.find_by(username: params[:user][:username])

        if user && user.authenticate(params[:user][:password])
            session[:user_id] = user.id
            redirect_to user_path(user)
        else
            flash[:message] = "Incorrect login info. Please Try Again."
            redirect_to login_path
        end
    end
end
