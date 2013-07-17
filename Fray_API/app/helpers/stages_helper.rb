module StagesHelper
  def select_for_stages
    Stage.all.collect {|x| [ x.name + ' ' + I18n.t('fray.models.small_stage'),x.id ]}
  end
end
