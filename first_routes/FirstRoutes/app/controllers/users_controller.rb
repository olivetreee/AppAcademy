class UsersController < ApplicationController
  def index
    render json: User.all
    # render json: str.to_json
  end

  def create
    user = User.new(params[:user].permit(:name, :email))
    if user.save!
      render json: user
    else
      render(
        json: user.errors.full_messages, status: :unprocessable_entity
      )
    end
  end

  def show
    wanted_user = User.find(params[:id])
    render json: wanted_user
  end

  def update
    user_to_update = User.find(params[:id])
    user_to_update.update!(user_params)
    render json: user_to_update
  end

  def destroy
    user_to_destroy = User.find(params[:id])
    user_to_destroy.destroy
    render json: User.all
  end

  private
  def user_params
    params.require(:user).permit(:name, :email)
  end
end
