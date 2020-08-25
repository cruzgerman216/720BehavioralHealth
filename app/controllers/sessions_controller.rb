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
        user = User.find_by(username: params[:user][:username]) || User.find_by(email: params[:user][:username])
        # user = User.find_by(username: params[:user][:username]) 
        if user && user.authenticate(params[:user][:password])
            session[:user_id] = user.id
            redirect_to user_path(user)
        else
            flash[:message] = "Incorrect login info. Please Try Again."
            redirect_to login_path
        end
    end
    
    def googleauth
        @user = User.find_or_create_by(email: auth["info"]["email"]) do |user|
            user.first_name = auth["info"]["name"].split(" ")[0]
            user.last_name = auth["info"]["name"].split(" ")[1]
            user.password = SecureRandom.hex(10)
        end
        if @user.save 
            session[:user_id] = @user.id 
            redirect_to user_path(@user)
        else 
            redirect_to '/'
        end
    end

    def auth 
        request.env['omniauth.auth']
    end
end
