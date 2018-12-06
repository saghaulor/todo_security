class TodosController < ApplicationController
  before_action :redirect_unauthenticated_users
  before_action :find_todo, only: [:show, :update, :destroy]

  def index
    @todos = Todo.where(user_id: current_user.id)
  end

  def show
    unless @todo
      render nothing: true, status: :not_found
    end
  end

  def new
  end

  def create
    @todo = Todo.create(body: params[:todo][:body], user_id: current_user.id)
    redirect_to todos_path
  end

  def update
    if @todo
      @todo.update_attributes(update_attrs)
      redirect_to todos_path
    else
      render nothing: true, status: :not_found
    end
  end

  def destroy
    if @todo
      @todo.destroy
      redirect_to todos_path
    else
      render nothing: true, status: :not_found
    end
  end

  protected
  def find_todo
    @todo = Todo.find_by(id: params[:id])
  end

  def update_attrs
    params.require(:todo).permit(:body, :user_id)
  end

  def redirect_unauthenticated_users
    unless session[:user_id]
      redirect_to controller: :sessions, action: :new
      return false
    end
  end
end
