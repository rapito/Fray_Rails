module TeachersHelper

  def teacher_get_name_with_specialty teacher
    teacher.first_name + ' ' + teacher.first_last_name + ' - '+ teacher.studies
  end

  def select_for_teachers
    Teacher.all.collect {|x| [teacher_get_name_with_specialty(x),x.id]}
  end

end
