module ApplicationHelper
    def id_admin?
        User.find(current_user).admin == 1
    end

    def display_errors
        if flash[:errors]
           render partial: 'layouts/error'
        end
    end

    def log_buttons
        if logged_in?
            link_to "Log Out", logout_path, method: :post
        else
            link_to "Login", new_session_path
        end
    end

    def account_button
        if logged_in?
            link_to "Account", user_path(current_user)
        end
    end

    def set_cart
        user = User.find(current_user)
            if carts = Cart.where(user_id: user.id) # Find all carts
                if carts.last.status == "completed" # Check if completed
                   @cart = user.carts.build # Make new cart
                else
                    @cart = carts.last
                end
            else
                @cart = user.carts.build # Make new cart
            end
    end

    def cart_show
        if logged_in?
            set_cart
            link_to "Your cart has #{@cart.cart_items.size} items", cart_path(@cart)
        end
    end

end
