class WorkOrdersController < ApplicationController

  def index
    #WILL NEED TO ADD CURRENT_USER TO THIS IF DEVISE GETS ADDED
    @work_orders = WorkOrder.all_workorders
  end

  def show
    #@work_order = WorkOrder(params[:id])
    @work_order = WorkOrder.find_workorder(params[:id])
  end

  def new
  end

  def edit
  end
end
