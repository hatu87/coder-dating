class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def index
    @users = User.all.shuffle
  end

  def create
    user = User.new(user_params)

    if user.save
      redirect_to login_path
    else
      flash[:error] = 'register fail'
      render 'new'
    end
  end

  def user_params
    params.require(:user).permit(:email, :name,:password, :password_confirmation)
  end
end
