module ApplicationHelper
    def id_admin?
        User.find(current_user).admin == 1
    end

    def display_errors
        if flash[:errors]
           render partial: 'layouts/error'
        end
    end

    def display_notice
        if flash[:notice]
            render partial: 'layouts/notice'
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
            link_to content_tag(:span, "Cart ") + content_tag(:span, " #{@cart.cart_items.size}", :class => "badge badge-light"), cart_path(@cart), :class => "btn btn-primary"
        end
    end

    def order_history_button
        if id_admin?
            link_to "See All Orders", user_carts_path(@user), :class => "btn btn-primary"
        else
            link_to "Orders History", user_carts_path(@user), :class => "btn btn-primary"
        end
    end


end
