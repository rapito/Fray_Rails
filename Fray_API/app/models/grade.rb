class Grade < ActiveRecord::Base
  belongs_to :lecture
  belongs_to :student, :class_name => 'User'
  has_one :grade_weight

  validates :value,  :presence => true
end
