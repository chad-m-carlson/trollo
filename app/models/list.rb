class List < ApplicationRecord
  belongs_to :work_order, optional: :true
  has_many :tasks

  def self.create_list(params)
    List.find_by_sql(["
      INSERT INTO lists (work_order_id, title, description, created_at, updated_at)
      VALUES (:work_order_id, :title, :description, :created_at, :updated_at)", {
        work_order_id: params[:work_order_id],
        title: params[:title],
        description: params[:description],
        created_at: DateTime.now,
        updated_at: DateTime.now
      }])
  end

  def self.set_list(l_id)
    List.find_by_sql(["
      SELECT *
      FROM lists
      WHERE #{l_id} = id
      "]).first
  end
end
