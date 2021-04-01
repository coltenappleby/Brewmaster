class BarsController < ApplicationController
    before_action :authorized
    def index
        @bars = Bar.all 
    end

    def show 
        @bar = Bar.find(params[:id])
    end
end
