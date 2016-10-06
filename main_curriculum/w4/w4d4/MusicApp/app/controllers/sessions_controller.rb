require 'byebug'
class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_credentials(
      session_params[:email], session_params[:password]
    )
    if user
      login(user)
      redirect_to user_url(user)
    else
      flash.now[:errors] = ["WRONG!"]
      render :new
    end
  end

  def destroy
    if current_user
      logout(current_user)
      redirect_to new_session_url
    end
  end

  def session_params
    params.require(:session).permit(:email, :password)
  end

end
