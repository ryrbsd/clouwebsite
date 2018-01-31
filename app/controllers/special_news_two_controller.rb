class SpecialNewsTwoController < ApplicationController
    
    def index
        @news = SpecialNewsTwo.where(:Authorized => true).order('id ASC')
    end
    
    def show
        @news = SpecialNewsTwo.find(params[:id])
    end
 
end
