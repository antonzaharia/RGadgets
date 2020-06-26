class CategoriesController < ApplicationController
    def index
        @categories = Category.all
    end

    def show
        @items = Category.find(params[:id]).items
    end
end
