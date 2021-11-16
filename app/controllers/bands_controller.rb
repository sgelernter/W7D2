class BandsController < ApplicationController

    def index 
        # debugger
        @bands = Band.all
        render :index
    end 

    def new 
        render :new
    end

    def create 
        band = Band.new(band_params)
        if band.save
            @bands = Band.all 
            render :index
        else 
            flash.now[:error] = 'Try again!'
            render :new 
        end
    end

    def edit 
        @band = Band.find(params[:id])
        if @band 
            render :edit 
        else
            flash[:error] = 'Something went wrong!'
            redirect_to bands_url
        end 
    end

    def update 
        @band = Band.find(params[:id])
        @band.update(band_params)
        redirect_to bands_url
    end

    def destroy 
        @band = Band.find(params[:id])
        if @band 
            @band.destroy 
            redirect_to bands_url
        else
            flash[:error] = 'Something went wrong!'
            redirect_to bands_url
        end 
    end

    private 

    def band_params
        params[:band].permit(:name)
    end

end