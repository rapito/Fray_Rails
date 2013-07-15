module ApplicationHelper

  #Helper for Forms when creating a new Entity
  #Males
  def new_m_entity_text entity_name
    I18n.t('fray.new_m') + ' ' + entity_name
  end
  #Female
  def new_f_entity_text entity_name
    I18n.t('fray.new_f') + ' ' + entity_name
  end

end
