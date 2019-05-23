class WorkOrder < ApplicationRecord
  
  has_many :lists, dependent: :destroy

end
