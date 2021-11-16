class ApplicationController < ActionController::Base

    helper_method :current_user, :logged_in?, :log_in_user!
    
    def current_user 
        User.find_by(session_token: session[:session_token])
    end

    def ensure_logged_in
        unless logged_in? 
            flash[:error] = ['You must log in first']
            redirect_to new_session_url
        end
    end

    def ensure_logged_out 
        if logged_in?
            flash[:error] = ['You are already logged in']
            redirect_to user_url(current_user)
        end
    end

    def logged_in?
        if current_user 
            current_user.session_token == session[:session_token]
        else
            false
        end
    end

    def login!(user)
        session[:session_token] = user.reset_session_token!
    end

end
