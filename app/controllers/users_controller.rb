class UsersController < ApplicationController
    before_action :require_login, :set_user
    skip_before_action :require_login, only: [:new, :create]

    
    def show
    end

    def edit
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            session[:cart_id] = find_last_cart(@user)
            redirect_to new_user_address_path(@user)
        else
            set_flash_errors
            render new_user_path
        end
    end

    def update
        if @user.update(edit_params)
            redirect_to user_path(@user)
        else
            set_flash_errors
            redirect_to edit_user_path(@user)
        end
    end

    private

    def user_params
        params.require(:user).permit(:name, :email, :password)
    end

    def edit_params
        params.require(:user).permit(:name, :email)
    end

    def set_user
        @user = User.find(current_user)
    end

    

end
