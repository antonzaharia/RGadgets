module ApplicationHelper

    # Checking if current user is admin 
    def is_admin?
        User.find(current_user).admin == 1
    end

    # Showing flash errors
    def display_flash_errors
        if flash[:errors]
            @errors = flash[:errors]
           render partial: 'layouts/error', :locals => { :errors => @errors }
        end
    end

    # Showing errors
    def display_errors
        if @errors
           render partial: 'layouts/error'
        end
    end

    # Showing notices
    def display_notice
        if flash[:notice]
            render partial: 'layouts/notice'
        end
    end

    # Depending if there is any session, creating sessions destroy link or new session link
    def log_buttons
        if logged_in?
            link_to "Log Out", logout_path, method: :post
        else
            link_to "Login", new_session_path
        end
    end

    # Creating User Show Button if there is any session started
    def account_button
        if logged_in?
            link_to "Account", user_path(current_user)
        end
    end

    # Bringing back the last user cart or creating new cart if last user cart is completed or the user is new.
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
    
    # Creating the cart Button
    def cart_show
        if logged_in?
            set_cart
            link_to content_tag(:span, "Cart ") + content_tag(:span, " #{@cart.cart_items.size}", :class => "badge badge-light"), cart_path(@cart), :class => "btn btn-primary"
        end
    end
    
    # Changing the text for the User Carts Index Button if user is admin.
    def order_history_button
        if is_admin?
            link_to "See All Orders", user_carts_path(@user), :class => "btn btn-primary"
        else
            link_to "Orders History", user_carts_path(@user), :class => "btn btn-primary"
        end
    end


end
