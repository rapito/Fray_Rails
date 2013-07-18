class Student < User

  attr_accessible :enrollment_code, :enrollment_outer_code,:group_id, :first_name, :middle_name, :first_last_name, :second_last_name, :identification_card, :phone_1, :phone_2, :address_1, :address_2 ,:nationality, :registration_date, :inactivity_date, :active, :passport

  #Un estudiante tiene varios records historicos
  has_many :records
  #un estudiante tiene varias notas
  has_many :grades
  #un estudiante tiene muchas clases
  has_and_belongs_to_many :lectures
  #has_many :lectures, :through => :lectures_students

  attr_accessor :group_id


  def self.without_group
    Student.all.reject{|x| x.lectures.size > 0}
  end

  def assign_to_group
     Group.find(group_id).lectures.each do |x|
        x.students << self
      end
  end

  def get_accumulated_score lecture_id
    val = 0;
    Grade.where(:lecture_id => lecture_id, :student_id => id).each  { |v| val+=v.value }
    val
  end

  def get_accumulated_weighted_score lecture_id
    val = 0
    Grade.where(:lecture_id => lecture_id, :student_id => id).each  do |v|
      if not v.grade_weight.eql? nil
        val+=v.value*(v.grade_weight.weight/100.0)
      else
        val+=v.value
      end
    end
    val
  end

  def get_grades_for lecture_id
    Grade.where(:lecture_id => lecture_id, :student_id => id)
  end

  validates :enrollment_code, :presence => true #,:format => { :with => /\A( [0-9]{3,} )\Z/i
  #validates :enrollment_outer_code, :format => { :with => /\A( [0-9]{3,} )\Z/i
  validates :group_id,        :presence => true #,:format => { :with => /\A( [0-9]{3,} )\Z/i


end