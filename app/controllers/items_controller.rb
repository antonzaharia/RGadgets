class ItemsController < ApplicationController
    include ItemsHelper
    
    def new
        @item = Item.new
    end

    def create
        @item = Item.new(item_params)
        @item.category = find_category
        if @item.save
            redirect_to new_item_model_path(@item)
        else
            flash[:errors] = @item.errors.full_messages
            redirect_to new_item_path
        end
    end

    def edit
        @item = Item.find_by(id: params[:id])
    end

    def update
        @item = Item.find_by(id: params[:id])
        @item.category = find_category
        if @item.update(item_params)
            redirect_to item_path(@item)
        else
            flash[:errors] = @item.errors.full_messages
            redirect_to edit_item_path(@item)
        end
    end

    def show
        @item = Item.find(params[:id])
    end

    def item_params
        params.require(:item).permit(:title, :image, :description, :price)
    end
end
