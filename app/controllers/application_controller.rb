class ApplicationController < ActionController::Base
    helper_method :logged_in?, :current_user

    def current_user
        session[:user_id]
    end

    def logged_in?
        !!current_user
    end

    def require_login
        if !logged_in?
            redirect_to root_path, alert: "You must be logged in to access this path."
        end
    end




    
end
