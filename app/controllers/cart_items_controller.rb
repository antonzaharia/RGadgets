class CartItemsController < ApplicationController
    before_action :set_current_cart

    def create
        @cart.cart_items.build(cart_item_params)
        @item = Item.find_by(id: cart_item_params[:item_id])
        if @cart.save
            redirect_to item_path(@item)
        else
            flash[:notice] = "Model and Color must be selected"
            redirect_to item_path(@item)
        end
    end

    def destroy
        cart_item = @cart.cart_items.where(id: params[:id])
        cart_item.delete_all
        redirect_to cart_path(@cart)
    end

    private
    def cart_item_params
        params.require(:cart_item).permit(:model_id, :color_id, :quantity, :item_id)
    end

    def set_current_cart
        @cart = current_cart
    end
end
