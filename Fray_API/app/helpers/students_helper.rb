module StudentsHelper
  def select_for_students

    Student.all.collect {|x| [get_user_name(x),x.id]}

  end
end
