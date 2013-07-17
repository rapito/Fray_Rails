module LecturesHelper

  def get_lecture_report


  end

  def lecture_get_name lecture
    lecture.subject.name + ' - ' +lecture.group.name
  end

end
