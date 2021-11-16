class UsersController < ApplicationController 

    before_action :ensure_logged_out, only: [:create, :new]

    def new 
        render :signup
    end

    def create 
        user = User.new(user_params)
        if user.save 
            login!(user)
            redirect_to user_url(user)
        else
            flash.now[:error] = ['User could not be saved']
            render :signup  
        end
    end

    private 

    def user_params 
        params[:user].permit(:email, :password, :session_token)
    end
end