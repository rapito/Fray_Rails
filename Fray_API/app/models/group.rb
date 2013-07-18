class Group < ActiveRecord::Base
  belongs_to :period
  belongs_to :teacher, :class_name => 'Teacher'
  belongs_to :stage
  has_many :lectures
  has_many :students, through: :lectures, :class_name => 'Student', :source => 'students'

  validates :name,    :presence => true , :length => { :minimum => 2 , :maximum => 30 }
  validates :suffix,  :presence => true , :length => {:maximum => 1 }
  validates :teacher, :presence => true
  validates :stage,   :presence => true
  validates :period,  :presence => true

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
