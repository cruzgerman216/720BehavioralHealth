class ApplicationController < ActionController::Base
    include ApplicationHelper
    # gives access to methods in the views
    private
        def redirect_if_not_logged_in 
            redirect_to '/' if !logged_in? 
        end
end
