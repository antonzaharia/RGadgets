class CartItemsController < ApplicationController
    def create
        @cart = current_cart
        @cart.cart_items.build(cart_item_params)
        if @cart.save
            redirect_to cart_path(@cart)
        else
            redirect_to root_path
        end
    end

    def destroy
        cart = current_cart
        cart_item = cart.cart_items.where(id: params[:id])
        cart_item.delete_all
        redirect_to cart_path(cart)
    end

    private
    def cart_item_params
        params.require(:cart_item).permit(:model_id, :color_id, :quantity, :item_id)
    end
end
