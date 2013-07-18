class Period < ActiveRecord::Base
  has_many :groups

  def humanize
    self.init_date.to_formatted_s(:long)  + ' - ' + self.end_date.to_formatted_s(:long)
  end
end
