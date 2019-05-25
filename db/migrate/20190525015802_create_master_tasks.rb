class CreateMasterTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :master_tasks do |t|
      t.string :task_title
      t.string :task_description
      t.integer :list_id
      t.integer :priority

      t.timestamps
    end
  end
end
