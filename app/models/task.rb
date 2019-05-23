class Task < ApplicationRecord
  belongs_to :list, optional: :true

  #CLASS METHOD
  def self.create_task(params)
    Task.find_by_sql(["
      INSERT INTO tasks (task_title, task_description, list_id, created_at, updated_at)
      VALUES (:task_title, :task_description, :list_id, :created_at, :updated_at)", {
        task_title: params[:task_title],
        task_description: params[:task_description],
        list_id: params[:list_id],
        created_at: DateTime.now,
        updated_at: DateTime.now
      }])
  end
end
