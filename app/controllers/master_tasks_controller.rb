class MasterTasksController < ApplicationController

  def index
    @master_tasks = MasterTask.all
  end

  def show
    @master_task = MasterTask.find(params[:id])
  end

  def new
  end

  def edit
  end
end
