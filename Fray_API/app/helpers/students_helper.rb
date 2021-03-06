module StudentsHelper
  def select_for_students
    Student.all.collect {|x| [get_user_name(x),x.id]}
  end

  def select_for_students_not_on_group
    Student.without_group.collect {|x| [get_user_name(x),x.id]}
  end
end
