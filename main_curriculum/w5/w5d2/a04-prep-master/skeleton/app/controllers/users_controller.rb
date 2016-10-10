class UsersController < ApplicationController
  def new
    @new_user = User.new
  end

  def create
    @new_user = User.new(user_params)
    if @new_user.valid?
      @new_user.save
      login(@new_user)
      redirect_to links_url
    else
      flash[:errors] = @new_user.errors.full_messages
      render :new
    end
  end

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
