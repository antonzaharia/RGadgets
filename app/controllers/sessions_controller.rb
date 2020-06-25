class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(email: params[:user][:email])

    if @user && @user.authenticate(signin_params[:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:errors] = ["Please check your credentials and try again"]
      redirect_to new_session_path
    end
  end

  def destroy
    session.delete :user_id
    redirect_to root_path
  end


  def signin_params
    params.require(:user).permit(:name, :password)
  end
end
