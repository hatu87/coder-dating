class SessionController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params.require(:user)[:email])

    if user && user.authenticate(params.require(:user)[:password])
      session[:user_id] = user.id
      redirect_to users_path
    else
      flash.now[:error] = 'Error login.'
      render :new
    end

  end

  def destroy
  end
end
