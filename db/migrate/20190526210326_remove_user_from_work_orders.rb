class RemoveUserFromWorkOrders < ActiveRecord::Migration[5.2]
  def change
    remove_reference :work_orders, :user, foreign_key: true
  end
end
