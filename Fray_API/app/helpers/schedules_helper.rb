module SchedulesHelper
  def humanize_schedule schedule
    schedule.day + ', ' + I18n.l( schedule.start_time, :format => "%I.%m %P").to_s + ' - ' + I18n.l( schedule.end_time, :format => "%I.%m %p")
  end
end
