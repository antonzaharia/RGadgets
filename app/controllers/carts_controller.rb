class CartsController < ApplicationController
    before_action :set_current_user

    def show
        @cart = Cart.find(params[:id])
        @cart_items = @cart.cart_items
    end

    def update
        current_cart.update(status: "checked out")
        new_cart = @user.carts.build
        new_cart.save
        session[:cart_id] = new_cart.id
        redirect_to user_path(@user)
    end

    def index
        @carts = @user.user_carts 
    end

    def completed
        @cart = Cart.find(params[:cart_id])
        @cart.update(status: "completed")
        redirect_to user_carts_path(current_user)
    end

end
