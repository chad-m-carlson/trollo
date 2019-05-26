class ListsController < ApplicationController

  def index
  end

  def show
  end

  def new
    @list = List.new
    @work_order = WorkOrder.find_workorder(params[:work_order_id])
  end

  def create
    @list = List.create_list(list_params)
    binding.pry
    redirect_to work_order_path(list_params[:work_order_id])
  end

  def edit
  end

  private

    def list_params
      params.require(:list).permit(:work_order_id, :title, :description)
    end
end
