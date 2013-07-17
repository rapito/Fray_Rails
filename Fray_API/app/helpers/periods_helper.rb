module PeriodsHelper

  def get_period_name period
    period.init_date.to_formatted_s(:long)  + ' - ' + period.end_date.to_formatted_s(:long)
  end

  def select_for_periods
    Period.all.collect{|x| [get_period_name(x) ,x.id] }
  end
end
