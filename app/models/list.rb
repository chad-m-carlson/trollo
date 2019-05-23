class List < ApplicationRecord
  belongs_to :work_order
  has_many :tasks
end
