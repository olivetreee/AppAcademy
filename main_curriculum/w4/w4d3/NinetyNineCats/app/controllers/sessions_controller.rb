class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_credentials(
      session_params[:user_name],
      session_params[:password]
    )
    if user
      login(user)
      flash[:messages] = ["User successfully logged in"]
      redirect_to cats_url
    else
      flash.now[:messages] = ["User not found!"]
      render :new
    end
  end

  def destroy
    if current_user
      logout(current_user)
      flash[:messages] = ["Bye bye."]
      redirect_to new_session_url
    end
  end

  private

  def session_params
    params.require(:session).permit(:user_name, :password)
  end
end
