class ModelsController < ApplicationController
    before_action :is_admin?
    skip_before_action :is_admin?, only: [:index, :show]
    
    def new
        @item = Item.find_by(id: params[:item_id]) 
        @model = @item.models.build
    end

    def create
        @item = Item.find_by(id: params[:item_id]) 
        @model = @item.models.build(model_params)
        if @model.save
            redirect_to new_item_model_path(@item)
        else
            flash[:errors] = @model.errors.full_messages
            redirect_to new_item_model_path(@item)
        end
        
    end

    def destroy
        @item = Item.find_by(id: params[:item_id])
        @model = @item.models.find(params[:id])
        @model.destroy
        redirect_to new_item_model_path(@item)
      end

    private
    def model_params
        params.require(:model).permit(:name)
    end

end
