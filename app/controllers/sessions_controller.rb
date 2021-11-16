class SessionsController < ApplicationController
    def log_in 
    end

    def log_out 
    end

    def new 
        render :new 
    end

    def create
        @user = User.find_by_credentials(params[:user][:email], params[:user][:password])
        session[:session_token] = SecureRandom::urlsafe_base64(16)
        @user.session_token = session[:session_token]
        @user.save!
        redirect_to user_url(@user)
    end

    def destroy 
    end
end