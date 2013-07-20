class GradeWeight < ActiveRecord::Base
  belongs_to :lecture
  #validates_uniqueness_of :grade_id

end
