class SessionsController < ApplicationController
  def new
  end

  def create
  # 既存ユーザー検索
    user = User.find_by(email: params[:session][:email].downcase)
  # confirm user exist and password authenticate
    if user && user.authenticate(params[:session][:password])
      # set userid into session
      session[:user_id] = user.id
      # move to user detail page
      redirect_to user_path(user.id)
    else
      # display message
      flash.now[:danger] = 'login failed'
      # display login page
      render 'new'
    end
  end

  def destroy
    # clear session
    session.delete(:user_id)
    # show logout message
    flash[:notice]="logout"

    # return to loginpage
    redirect_to new_session_path
  end
end
