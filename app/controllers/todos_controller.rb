require 'rollbar'
class TodosController < ApplicationController
  def new
    @todo = Todo.new
  end

  def create
    @todo = Todo.new(todo_params)
    'a' + 1
    if @todo.save
      redirect_to todos_path
    else
      redirect_to new_todo_path
    end
  end

  def show
    @todo = Todo.find(params[:id])
    Rollbar.error('banana', :params => params)
    throw new Error('show!')
    # begin
    #   @todo = Todo.find(params[:id])
    # rescue ActiveRecord::RecordNotFound => e
    #   Rollbar.error(e, )
    # end
  end

  def index
    Rollbar.info('showing the todos index')
    @todos = Todo.all
  end

  private
  def todo_params
    params.require(:todo).permit(:title, :notes)
  end
end
