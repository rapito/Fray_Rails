module LecturesHelper

  def lecture_get_name lecture
    lecture.subject.name + ' - ' +lecture.group.name
  end

end
