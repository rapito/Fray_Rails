class Lecture < ActiveRecord::Base
  belongs_to :group
  belongs_to :schedule
  belongs_to :subject
  belongs_to :teacher,:class_name => 'User'
  has_and_belongs_to_many :students,:class_name => 'Student'
  #has_many :students, :through => :lectures_students
  has_many :grades
  has_many :weights, :class_name => 'GradeWeight'
end
