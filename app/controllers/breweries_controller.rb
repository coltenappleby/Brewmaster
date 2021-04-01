class BreweriesController < ApplicationController
    before_action :authorized
    def index
        @breweries = Brewery.all
    end

    def show
        @brewery = Brewery.find(params[:id])
    end
end
