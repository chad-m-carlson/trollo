class Task < ApplicationRecord
  belongs_to :list, optional: :true
  
  def update_task(t_id, params)
    Task.find_by_sql(["
      UPDATE tasks
      SET task_title = ?, task_description = ?, list_id = ?, id = ?, updated_at = ?
      WHERE id = #{t_id};",
      params[:task_title],params[:task_description],params[:list_id],
  t_id, DateTime.now
      ])
  end
  
  def delete_task(t_id)
    Task.find_by_sql(["
      DELETE FROM tasks
      WHERE id = #{t_id}
      "])
  end
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

  def self.single_task(t_id)
    Task.find_by_sql(["
      SELECT *
      FROM tasks
      --SWITCH THESE BELOW
      WHERE #{t_id} = id
      "])
  end

  def self.sort_by_priority
    order(priority: :asc)
  end

  def self.set_list(l_id)
    List.find_by_sql(["
      SELECT *
      FROM lists
      WHERE #{l_id} = id
      "]).first
  end

end
