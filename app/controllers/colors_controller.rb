class ColorsController < ApplicationController
    before_action :is_admin?, :set_item

    def new
        @color = @item.colors.build
    end

    def create
        @color = @item.colors.build(color_params)
        if @color.save
            redirect_to new_item_color_path(@item)
        else
            flash[:errors] = @color.errors.full_messages
            redirect_to new_item_color_path(@item)
        end
    end

    def destroy
        @color = @item.colors.find(params[:id])
        @color.destroy
        redirect_to new_item_color_path(@item)
      end

    private
    def color_params
        params.require(:color).permit(:name)
    end
end
