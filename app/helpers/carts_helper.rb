module CartsHelper
    def checkout_button
        if @user.admin == 1
            button_to "Mark as completed", cart_completed_path(@cart) , method: :patch
        else
            button_to "Checkout", cart_path , method: :patch
        end
    end
end
