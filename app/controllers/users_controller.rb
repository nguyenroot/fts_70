class UsersController < ApplicationController

  def show
    redirect_to root_path
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      log_in @user
      flash[:success] = t "welcome"
      redirect_to @user
    else
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit :name, :email,
      :chatwork_id, :password, :password_confirmation
  end

  def logged_in_user
    unless logged_in?
      flash[:danger] = t "please_login"
      redirect_to login_url
    end
  end
end
