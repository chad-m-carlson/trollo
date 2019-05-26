class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :set_list, only: [:new, :create,:update ,:edit, :show]

  def index
  end

  def show
  end

  def new
    @task = Task.new
  end
  
  def create
    @task = Task.create_task(task_params)   
    redirect_to work_order_path(@list.work_order_id)
  end

  def edit
  end
  
  def update
    @task.update_task(@task.id, task_params)
    redirect_to work_order_path(@list.work_order_id)
  end

  def destroy
    @task.delete_task(params[:id])
    binding.pry
    redirect_to work_order_path(@task.list.work_order_id)
  end

  private

  def set_task
    @task = Task.single_task(params[:id])
  end

  def set_list
    @list = List.set_list(params[:list_id])
  end

  def task_params
    params.require(:task).permit(:task_title, :task_description, :list_id, :updated_at, :id, :priority )
  end
end
