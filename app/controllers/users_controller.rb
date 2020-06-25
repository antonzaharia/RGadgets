class UsersController < ApplicationController
    before_action :require_login
    skip_before_action :require_login, only: [:new, :create]
    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to new_user_address_path(@user)
        else
            flash[:errors] = @user.errors.full_messages
            render new_user_path
        end
    end

    def show
        @user = User.find(current_user)
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        if @user.update(edit_params)
            redirect_to user_path(@user)
        else
            flash[:errors] = @user.errors.full_messages
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

end
