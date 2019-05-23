class WorkOrder < ApplicationRecord
  
  has_many :lists, dependent: :destroy

  #CLASS METHODS
  def self.all_workorders
    WorkOrder.find_by_sql("
      SELECT *
      FROM work_orders
      ")
  end

  def self.find_workorder(params)
    WorkOrder.find_by_sql("
      SELECT *
      FROM work_orders
      WHERE work_orders.id = #{params}
      ").first
  end
end
