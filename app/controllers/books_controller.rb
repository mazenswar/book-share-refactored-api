class BooksController < ApplicationController

    def index
        render json: Book.all
    end

    def available
        render json: Book.available
    end

 
end


