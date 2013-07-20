class Grade < ActiveRecord::Base
  belongs_to :lecture
  belongs_to :student, :class_name => 'User'
  has_one :grade_weight

  scope :by_lecture, lambda  { |l| where(:lecture_id => l) }
  scope :by_assignment, lambda { |a| where(:comment => a) }
  scope :highest, order("value DESC")



  validates :value,  :presence => true
end
