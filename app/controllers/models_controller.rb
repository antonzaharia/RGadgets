class ModelsController < ApplicationController
    before_action :is_admin?, :set_item
    
    def new
        @model = @item.models.build
    end

    def create
        @model = @item.models.find_or_create_by(name: model_params[:name])
        @model.cart = current_cart
        if @model.save
            redirect_to new_item_model_path(@item)
        else
            flash[:errors] = @model.errors.full_messages
            redirect_to new_item_model_path(@item)
        end
    end

    def destroy
        @model = @item.models.find(params[:id])
        @model.destroy
        redirect_to new_item_model_path(@item)
      end

    private
    def model_params
        params.require(:model).permit(:name, :cart_id)
    end

end
