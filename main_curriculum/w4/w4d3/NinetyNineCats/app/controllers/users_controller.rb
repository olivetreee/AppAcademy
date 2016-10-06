class UsersController < ApplicationController
  def new
    @user = User.new
    render :new
  end

  def create
    new_user = User.new(user_params)
    if new_user.save
      flash[:messages] = ["User successfully created!"]
      redirect_to cats_url
    else
      flash.now[:messages] = new_user.errors.full_messages
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:user_name, :password)
  end
end
