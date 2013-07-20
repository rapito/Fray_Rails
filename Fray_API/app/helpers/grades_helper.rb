module GradesHelper

  def find_grades_for_student_lecture student,lecture
    student.grades.where(:lecture_id => lecture.id).all
  end

  def assignments_select student,lecture

    assignments = []

    I18n.t('fray.lecture_assignments').each do |x|
      assignments.push x
    end

    Grade.where(:student_id => student.id, :lecture_id => lecture.id).each do |x|
      assignments.delete x.comment
    end

    assignments

  end
end
