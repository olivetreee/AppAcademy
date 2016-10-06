require 'byebug'
class UsersController < ApplicationController
  def new
  end

  def show
    @user = User.find(params[:id])
    render :show
  end

  def create
    @new_user = User.new(user_params)
    if @new_user.valid?
      @new_user.save!
      login(new_user)
      redirect_to user_url(@new_user)
    else
      flash.now[:errors] = @new_user.errors.full_messages
      render :new
    end
  end


  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
