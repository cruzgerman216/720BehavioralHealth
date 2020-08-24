class UsersController < ApplicationController
    def new 
        @user = User.new
    end

    def create 
         @user = User.initiate_user_type(params[:user][:role],user_params)
        if @user.save 
            session[:user_id] = @user.id 
            redirect_to @user
        else
            render :new
        end
    end

    def show
        redirect_if_not_logged_in
        @user = User.find_by_id(params[:id])
        redirect_to '/' if !@user
    end

    private
    def user_params 
        params.require(:user).permit(:first_name, :last_name, :username, :email, :password, :role)
    end
end
