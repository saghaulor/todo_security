class SessionsController < ApplicationController
  skip_before_action :set_current_user, only: [:new, :create]
  def new
    if session[:user_id]
      redirect_to todos_path
    else
      render :new
    end
  end

  def create
    @user = User.where("login = ? AND password = '#{auth_params[:password]}'", auth_params[:login]).first
    if @user
      @current_user = @user
      session[:user_id] = @user.id
      redirect_to root_url
      return true
    elsif User.find_by(login: auth_params[:login])
      flash.now[:alert] = "Incorrect password!"
    else
      flash.now[:alert] = "User not found!"
    end
    render :new
  end

  def destroy
    session[:user_id] = nil
    reset_session
    redirect_to root_url
  end

  protected
  def auth_params
    params.require(:user).permit(:login, :password)
  end
end
