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

  #validates :terms, :acceptance => true
  #validates :password, :confirmation => true
  #validates :username, :exclusion => { :in => %w(admin superuser) }
  #validates :email, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create }
  #validates :age, :inclusion => { :in => 0..9 }
  #validates :first_name, :length => { :maximum => 30 }
  #validates :age, :numericality => true
  #validates :username, :presence => true
  #validates :username, :uniqueness => true

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
