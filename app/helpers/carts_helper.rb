module CartsHelper

    # Behavior of the Checkout button from the Cart Show Page (Admin and User)
    def checkout_button
        if @user.admin?
            if @cart.checked_out?
              button_to "Mark as completed", cart_completed_path(@cart) , method: :patch, :class => "btn btn-success"
            else
              content_tag(:p, "Order Completed", :class => "alert alert-dark")
            end
        elsif @cart.completed? || @cart.checked_out?
            content_tag(:p, "Order Cannot be mofified", :class => "alert alert-dark")
        elsif  @cart.cart_items.empty?
            content_tag(:p, "Cart is empty", :class => "alert alert-dark")
        else
            button_to "Checkout", cart_path , method: :patch, :class => "btn btn-success float_right"
        end
    end

    # Creating the Delete Button for the cart_item in the Cart Show page.
    # Disabling that button if the cart is checked out or completed.
    def remove_button(cart_item)
        if @cart.pending? || @cart.status == nil
           link_to "remove from cart", cart_cart_item_path(@cart, cart_item), method: :delete, :class => "btn btn-danger" 
        else
            link_to "remove from cart", root_path , :class => "btn btn-danger disabled" 
        end
    end

end
