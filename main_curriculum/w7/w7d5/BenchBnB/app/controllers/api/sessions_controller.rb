class Api::SessionsController < ApplicationController

  def create
    @user = User.find_by_credentials(
    user_params[:username], user_params[:password]
    )

    if @user
      login(@user)
      render "api/users/show"
    else
      render json: "Wrong credentials, dumbass.", status: 404
    end

  end

  def destroy
    if current_user
      logout
      render json: {}
    else
      render json: "You're not even logged in, dumbass", status: 404
    end
  end


  private

  def user_params
    params.require(:user).permit(:username, :password)
  end

end
