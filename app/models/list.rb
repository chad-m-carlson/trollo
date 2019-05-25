class List < ApplicationRecord
  belongs_to :work_order, optional: :true
  has_many :tasks

  def self.find_list(list_id)
    List.find_by_sql(["
      SELECT *
      FROM lists 
      WHERE #{list_id} = id;
      " ]).first
  end
end
