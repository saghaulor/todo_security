class UsersController < ApplicationController
  before_action :find_user

  def show
    if @user && @current_user.id == @user.id
    elsif @user.nil?
      render nothing: true, status: :not_found
    else
      render nothing: true, status: :forbidden
    end
  end

  def update
    if @user
      @user.avatar_url = user_params[:avatar_url]
      @user.save
      redirect_to user_path(@user)
    else
      render nothing: true, status: :not_found
    end
  end

  private
  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:avatar_url, :firstname, :lastname)
  end
end
