class Api::SessionsController < ApplicationController

  def create
    @user = User.find_by_credentials(
    user_params[:username], user_params[:password]
    )
    if @user
      login(@user)
      render "/api/users/view/show"
    else
      render json @user.errors.full_messages
    end
  end

  def destroy
    if current_user
      logout
      render json {}
    else
      render "/public/404"
    end
  end


  private

  def user_params
    params.require(:user).permit(:username, :password)
  end

end
