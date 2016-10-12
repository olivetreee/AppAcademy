class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_credentials(params[:user][:username], params[:user][:password])
    if user
      login_user(user)
      redirect_to subs_url
    else
      flash.now[:messages] = ["Invalid Credentials"]
      render :new
    end
  end

  def destroy
    user = current_user
    if user
      logout_user(user)
      redirect_to new_session_url
    end
  end
end
