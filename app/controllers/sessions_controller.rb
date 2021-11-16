class SessionsController < ApplicationController

    before_action :ensure_logged_in, only: [:destroy]
    before_action :ensure_logged_out, only: [:new, :create]

    def new 
        render :login
    end

    def create
        @user = User.find_by_credentials(params[:user][:email], params[:user][:password])
        if @user
            login!(@user)
            redirect_to user_url(@user)
        else 
            flash[:error] = ['Not valid user credentials']
            redirect_to new_session_url
        end
    end

    def destroy 
        current_user.reset_session_token!
        session[:session_token] = nil
        render :login
    end
end