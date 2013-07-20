class Grade < ActiveRecord::Base
  belongs_to :lecture
  belongs_to :student, :class_name => 'User'
  #has_one :weight, :class_name => 'GradeWeight'

  scope :by_lecture, lambda  { |l| where(:lecture_id => l) }
  scope :by_assignment, lambda { |a| where(:comment => a) }
  scope :highest, order("value DESC")

  def get_weight
    GradeWeight.where(:lecture_id => self.lecture.id,:comment => self.comment).first
  end

  validates :value,  :presence => true
end
