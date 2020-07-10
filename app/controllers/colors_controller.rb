class ColorsController < ApplicationController
    before_action :is_admin?, :set_item

    def new
        @color = Color.new
    end

    def create
        @color = @item.colors.find_or_create_by(name: color_params[:name])
        if @color.save
            redirect_to new_item_color_path(@item)
        else
            @errors = @color.errors.full_messages
            render :new
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
