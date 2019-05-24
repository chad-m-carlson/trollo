class TasksController < ApplicationController
  before_action :set_list

  def index
  end

  def show
  end

  def new
    @task = Task.new
    @list = List.find(params[:list_id])
  end
  
  def create
    @list = List.find(params[:list_id])
    @task = Task.create_task(params.require(:task).permit(:task_title, :task_description, :list_id))   
    redirect_to work_order_path(@list.work_order_id)
  end

  def edit
  end

  private

  def set_list
  end
end
