class UsersController < ApplicationController
    before_action :user_authorized?, :set_current_user
    skip_before_action :user_authorized?, only: [:new, :create]
    skip_before_action :set_current_user, only: [:new, :create]
 
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
            session_start(@user)
        else 
            set_errors
            render new_user_path
        end
    end

    def update
        if @user.update(edit_params)
            redirect_to user_path(@user)
        else
            set_errors
            render :edit
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
