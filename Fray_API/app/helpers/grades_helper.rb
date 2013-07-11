module GradesHelper

  def find_grades_for_student_lecture student,lecture
    student.grades.where(:lecture_id => lecture.id).all
  end
end
