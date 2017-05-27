class SpecialNewsOneController < ApplicationController
    
    def index
        @news = SpecialNewsOne.where(:Authorized => true)
        @news_one = @news.where(:id => 1).first
        @news_two = @news.where(:id => 2).first
    end
    
    def show
        @news = SpecialNewsOne.find(params[:id])
    end

 
end
