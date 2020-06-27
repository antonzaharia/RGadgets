class CartsController < ApplicationController


    def show
        @cart = current_cart
        @cart_items = CartItem.where(cart_id: session[:cart_id]).all
    end

    def update
        @user = User.find(current_user)
        current_cart.status = "completed"
        new_cart = @user.carts.build
        new_cart.save
        session[:cart_id] = new_cart.id
        redirect_to user_path(@user)
    end

end
