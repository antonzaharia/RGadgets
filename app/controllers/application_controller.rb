class ApplicationController < ActionController::Base
    helper_method :logged_in?, :current_user

    def current_user
        session[:user_id]
    end

    def user_authorized?
        if !logged_in?
            flash[:notice] = "You have to be logged in to continue."
            redirect_to new_session_path
        end
    end

    def is_admin?
        if User.find(current_user).admin != 1
            redirect_to root_path
        end
    end

    def current_cart
        Cart.find_by(id: session[:cart_id])
    end

    def logged_in?
        !!current_user
    end

    def require_login
        if !logged_in?
            redirect_to root_path, alert: "You must be logged in to access this path."
        end
    end

    def find_last_cart(user)
        if user.carts.empty?
            cart = user.carts.build
            cart.save
            cart.id
        else
            user.carts.last.id
        end
    end

    def set_flash_errors
        flash[:errors] = @user.errors.full_messages
    end

    def set_current_user
        @user = User.find(current_user)
    end



    
end
