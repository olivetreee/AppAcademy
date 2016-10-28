class Api::UsersController < ApplicationController

  def create
    @user = User.new(user_params)
    if @user.save
      login(@user)
      render "api/users/show"
    else
      errors = @user.errors.full_messages
      if errors.any? {|err| err.include?("already been taken")}
        status_code = 401
      elsif errors.any? {|err| err.include?("Password is too short")}
        status_code = 422
      end
      render json: @user.errors.full_messages, status: status_code
    end
  end

  def show
    @user = User.find(params[:id])
  end


  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
