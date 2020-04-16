class BookAuthorsController < ApplicationController
    def index 
        render json: BookAuthor.all
    end
end
