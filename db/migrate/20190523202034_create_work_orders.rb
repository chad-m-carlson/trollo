class CreateWorkOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :work_orders do |t|
      t.string :customer
      t.string :description
      t.string :tail_number
      t.string :serial_number
      t.string :date_opened
      t.string :date_needed

      t.timestamps
    end
  end
end
