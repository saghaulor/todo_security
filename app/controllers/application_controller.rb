# coding: utf-8
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  attr_reader :current_user

  before_action :set_current_user
  after_action :unset_current_user

  private
  def set_current_user
    @current_user = User.where(id: session[:user_id]).first
    if @current_user
      return true
    else
      redirect_to new_session_path
    end
  end

  def unset_current_user
    @current_user = nil
  end
end
