class GradeWeight < ActiveRecord::Base
  belongs_to :grade
  validates_uniqueness_of :grade_id

end
