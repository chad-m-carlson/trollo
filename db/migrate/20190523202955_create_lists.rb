class CreateLists < ActiveRecord::Migration[5.2]
  def change
    create_table :lists do |t|
      t.integer :work_order_id
      t.string :title
      t.string :description
      t.belongs_to :work_order, foreign_key: true

      t.timestamps
    end
  end
end
