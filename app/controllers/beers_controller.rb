class BeersController < ApplicationController
    before_action :authorized

    def index
        @beers = Beer.all
    end

    def show
        find_beer 
        @new_review = Review.new 
    end

    def new
        beer_styles 
        
        @beer = Beer.new
    end
    
    def create
        @beer = Beer.create(beer_params(:name, :style, :brewery_id, :alocohol ))
        redirect_to beer_path(@beer)
    end

    private

    def find_beer
        @beer = Beer.find(params[:id])
    end

    def beer_params(*args)
        params.require(:beer).permit(*args)
    end

    def beer_styles
        @styles = ["lager", "IPA", "Stout", "NE IPA", "Cider", "Sour", "Porter"]
    end
end
