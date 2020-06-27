class ColorsController < ApplicationController
    before_action :is_admin?
    skip_before_action :is_admin?, only: [:index, :show]

    def new
        @item = Item.find_by(id: params[:item_id]) 
        @color = @item.colors.build
    end

    def create
        @item = Item.find_by(id: params[:item_id]) 
        @color = @item.colors.build(color_params)
        if @color.save
            redirect_to new_item_color_path(@item)
        else
            flash[:errors] = @color.errors.full_messages
            redirect_to new_item_color_path(@item)
        end
        
    end

    def destroy
        @item = Item.find_by(id: params[:item_id])
        @color = @item.colors.find(params[:id])
        @color.destroy
        redirect_to new_item_color_path(@item)
      end

    private
    def color_params
        params.require(:color).permit(:name)
    end
end
