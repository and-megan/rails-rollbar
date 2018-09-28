require 'rollbar'
class TodosController < ApplicationController
  def new
    @todo = Todo.new
  end

  def create
    @todo = Todo.new(todo_params)
    # this is a super long message. why is this message just the longest comment of all time. whoever wrote this really should learn how to use their return key to make a new line. pretty ridiculous.
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
