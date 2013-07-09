module GroupsHelper
  def group_get_period group
    group.period.init_date.to_formatted_s(:long)  + ' - ' + group.period.end_date.to_formatted_s(:long)
  end
end
