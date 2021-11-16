class UsersController < ApplicationController 

    def new 
        render :new
    end

    def create 
        debugger
        user = User.new(user_params)
        if user.save 
            redirect_to users_url
        else
            flash.now[:error] = ['User could not be saved']
            render :new  
        end
    end

    

    private 

    def user_params 
        params[:user].permit(:email, :password, :session_token)
    end
end