class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  before_action :set_list, only: [:update ,:edit, :show]

  def index
  end

  def show
  end

  def new
    @task = Task.new
    # CANT FIGURE @LIST OUT IN SQL. :LIST_ID DOESN'T TRANSFER OVER AS A NUMBER AS I CAN TELL, SAME FOR CREATE. FIND_LIST METHOD IS IN LIST MODEL
    #@lsit = List.find_list(:list_id)
    @list = List.find(params[:list_id])
  end
  
  def create
    # CANT FIGURE @LIST OUT IN SQL. :LIST_ID DOESN'T TRANSFER OVER AS A NUMBER AS I CAN TELL, SAME FOR CREATE. FIND_LIST METHOD IS IN LIST MODEL
    @list = List.find(params[:list_id])
    @task = Task.create_task(params.require(:task).permit(:task_title, :task_description, :list_id))   
    redirect_to work_order_path(@list.work_order_id)
  end

  def edit
    # @task = Task.find(params[:id])

  end
  
  def update
    @task.update_task(@task.id, params.require(:task).permit(:task_title, :task_description, :list_id, :updated_at, :id ))
    redirect_to work_order_path(@list.work_order_id)
  end

  def destroy
    @task.delete_task(params[:id])
    #FIX THIS PATH######################################
    redirect_to work_orders_path
  end

  private

  def set_task
    @task = Task.find(params[:id])
    # @task = Task.single_task(params[:id])
  end

  def set_list
    @list = Task.set_list(params[:list_id])
  end
end
