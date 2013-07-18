module LecturesHelper

  def get_accumulated_score lecture
    score = 0


  end

  def lecture_get_name lecture
    lecture.subject.name + ' - ' +lecture.group.name
  end

end
