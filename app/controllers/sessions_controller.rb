class SessionsController < ApplicationController
  
  def new
    @user = User.new
  end

  def create
    if auth
      @user = User.where(:uid => auth['uid'].to_s).first || User.create_with_omniauth(auth)
      session_start(@user)
    else
      @user = User.find_by(email: signin_params[:email])
      if @user && @user.authenticate(signin_params[:password])
        session_start(@user)
      else
        flash[:errors] = ["Please check your credentials and try again"]
        redirect_to new_session_path
      end
    end
  end

  def destroy
    session.delete :user_id
    session.delete :cart_id
    redirect_to root_path
  end

  private

  def signin_params
    params.require(:user).permit(:email, :password)
  end

  def auth
    request.env['omniauth.auth']
  end

end
