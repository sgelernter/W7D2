class ApplicationController < ActionController::Base
    
    def current_user 
        User.find_by(session_token: session[:session_token])
    end

    def ensure_logged_in
    end

    def logged_in?
    end

    def login!
    end

    def logout!
    end
end
