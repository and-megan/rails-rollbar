require 'rollbar'
class TodosController < ApplicationController
  def new
    @todo = Todo.new
  end

  def create
    @todo = Todo.new(todo_params)
    if @todo.save
      byebug
      redirect_to todos_path
    else
      redirect_to new_todo_path
    end
  end

  def show
    @todo = Todo.find(params[:id])
  end

  def index
    @todos = Todo.all
  end

  private
  def todo_params
    params.require(:todo).permit(:title, :notes)
  end
end
