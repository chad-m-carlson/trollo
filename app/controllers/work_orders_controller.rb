class WorkOrdersController < ApplicationController
before_action :set_work_order, only: [:show, :edit, :update, :destroy]

  def index
    #WILL NEED TO ADD CURRENT_USER TO THIS IF DEVISE GETS ADDED
    @work_orders = WorkOrder.all_workorders
  end

  def show
    #@work_order = WorkOrder(params[:id])
  end

  def new
    @work_order = WorkOrder.new
  end

  def create 
    @work_order = WorkOrder.create_work_order(work_order_params)
    redirect_to work_orders_path
  end

  def edit
  end

  def update 

    @work_order.update_work_order(@work_order.id, work_order_params)
    redirect_to work_order_path(@work_order)
  end

  def destroy 
    @work_order.delete_work_order(params[:id])
    redirect_to work_orders_path
  end

  private

    def set_work_order
      @work_order = WorkOrder.find_workorder(params[:id])
    end

    def work_order_params
      params.require(:work_order).permit(:customer, :description, :tail_number, :serial_number, :date_opened, :date_needed, :updated_at, :created_at)
    end
end
