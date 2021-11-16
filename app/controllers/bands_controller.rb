class BandsController < ApplicationController

    def index 
        @bands = Band.all
        render :index
    end 

    def new 
        render :new
    end

    def create 
    end

    def edit 
    end

    def update 
    end

    def destroy 
    end

    private 

    def band_params
        params[:band].permit(:name)
    end

end