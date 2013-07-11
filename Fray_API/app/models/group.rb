class Group < ActiveRecord::Base
  belongs_to :period
  belongs_to :teacher, :class_name => 'Teacher'
  belongs_to :stage
  has_many :lectures
  has_many :students, through: :lectures, :class_name => 'Student', :source => 'students'

  def students
    students = []
    self.lectures.collect do |x|
      x.students.each do |s|
        students.push s unless students.include? s
      end
    end
    students
  end

end
