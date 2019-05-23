class TasksController < ApplicationController
  def index
  end

  def show
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.create_task(params.require(:task).permit(:task_title, :task_description, :list_id))   
    redirect_to path 
  end

  def edit
  end
end
