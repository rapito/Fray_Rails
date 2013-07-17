class Schedule < ActiveRecord::Base
  #un Horario pertenece a una clase
  has_many :lectures

  def humanize
    self.day + ', ' + I18n.l( self.start_time, :format => "%I.%m %P").to_s + ' - ' + I18n.l( self.end_time, :format => "%I.%m %p")
  end
end
