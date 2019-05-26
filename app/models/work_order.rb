class WorkOrder < ApplicationRecord
  
  has_many :lists, dependent: :destroy
  has_many :users

  
  def update_work_order(w_id, params)
    WorkOrder.find_by_sql(["
      UPDATE work_orders
      SET customer = ?, description = ?, tail_number = ?, serial_number = ?, date_opened = ?, date_needed = ?, updated_at = ?
      WHERE id = #{w_id}" , 
        params[:customer],
        params[:description],
        params[:tail_number],
        params[:serial_number],
        params[:date_opened],
        params[:date_needed],
        DateTime.now
    ])
      end
      
      def delete_work_order(w_id)
        WorkOrder.find_by_sql("
          DELETE FROM work_orders
          WHERE id = #{w_id}
          ")
      end
  #CLASS METHODS
  def self.all_workorders
    WorkOrder.find_by_sql("
      SELECT *
      FROM work_orders
      ")
  end

  def self.find_workorder(w_id)
    WorkOrder.find_by_sql("
      SELECT *
      FROM work_orders
      WHERE work_orders.id = #{w_id}
      ").first
  end

  def self.create_work_order(params)
    WorkOrder.find_by_sql(["
      INSERT INTO work_orders (customer, description, tail_number, serial_number, date_opened, date_needed, created_at, updated_at)
      VALUES (:customer, :description, :tail_number, :serial_number, :date_opened, :date_needed, :created_at, :updated_at)",{
        customer: params[:customer],
        description: params[:description],
        tail_number: params[:tail_number],
        serial_number:params[:serial_number],
        date_opened:params[:date_opened],
        date_needed: params[:date_needed],
        created_at: DateTime.now,
        updated_at: DateTime.now
      }])
  end
end
