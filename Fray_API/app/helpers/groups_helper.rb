module GroupsHelper
  def group_get_period group
    group.period.init_date.to_formatted_s(:long)  + ' - ' + group.period.end_date.to_formatted_s(:long)
  end

  def group_get_name group

    group.name+' - '+group.suffix

  end

  def group_get_long_name group

    group.name+' - '+group.suffix+': '+group.stage.name

  end
end
