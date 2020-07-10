class ApplicationController < ActionController::Base
    helper_method :logged_in?, :current_user

    # Returning User ID from session hash
    def current_user
        session[:user_id]
    end

    # Redirecting to login path if the no session is started
    def user_authorized?
        if !logged_in?
            flash[:notice] = "You have to be logged in to continue."
            redirect_to new_session_path
        end
    end

    # Redirecting to root path if the user is not admin
    def is_admin?
        if current_user && set_current_user.admin != 1
            redirect_to root_path
        end
    end

    # Finding the cart from the session hash
    def current_cart
        Cart.find_by(id: session[:cart_id])
    end

    # Returning true if session hash contain user_id
    def logged_in?
        !!current_user
    end

    # Returns last cart of the user or creates new cart
    def find_last_cart(user)
        if user.carts.empty?
            cart = user.carts.build
            cart.save
            cart.id
        else
            user.carts.last.id
        end
    end

    # Sets the errors of the user instance
    def set_flash_errors
        flash[:errors] = @user.errors.full_messages
    end

    # Sets the errors of the user instance
    def set_errors
        @errors = @user.errors.full_messages
    end

    # Finding the user based on session hash
    def set_current_user
        @user = User.find(current_user)
    end

    # Sets the session hash and returning to the User Show page
    def session_start(user)
        session[:user_id] = user.id
        session[:cart_id] = find_last_cart(user)
        redirect_to user_path(user)
    end

    # Find the item instance based on the item_id from params hash
    def set_item
        @item = Item.find_by(id: params[:item_id]) 
    end

    
end
