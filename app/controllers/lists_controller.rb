class ListsController < ApplicationController
  before_action :set_list, only: [:show, :destroy, :edit, :update]
  before_action :customer?, only: [:new, :create, :edit, :update, :destroy]

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
    redirect_to work_order_path(list_params[:work_order_id])
  end

  def edit
  end

  def update
    @list.update_list(@list.id, list_params)
    redirect_to work_order_path(@list.work_order_id)
  end

  def destroy 
    #FIGURE OUT HOW TO DESTROY DEPENDENTS WITH SQL##########################
    @list.destroy
    # @list.delete_list(params[:id])
    redirect_to work_order_path(@list.work_order_id)
  end

  private

    def customer?
      if current_user.try(:customer?)
        flash[:error] = "Invalid Credentials"
        redirect_to work_order_list_path(@list)
      end
    end

    def list_params
      params.require(:list).permit(:work_order_id, :title, :description)
    end

    def set_list
      @list = List.set_list(params[:id])
    end
end
