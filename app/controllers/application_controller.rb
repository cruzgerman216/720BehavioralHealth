class ApplicationController < ActionController::Base
    
    helper_method :current_user, :logged_in?, :authorized?, :redirect_if_not_authorized

    private
        def redirect_if_not_logged_in 
            redirect_to '/login' if !logged_in? 
        end

        def current_user 
            @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
        end
    
        def logged_in? 
            !!session[:user_id]
        end


        def redirect_if_not_authorized_or_owner
            redirect_to users_path(current_us) if current_user.id != params[:id].to_i unless authorized?
        end

        def redirect_if_not_authorized 
            redirect_to users_path(current_us) if !authorized? 
        end

        def authorized?
            current_user.program_coordinator? if current_user
        end
end
