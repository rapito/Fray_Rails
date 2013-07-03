class Record < ActiveRecord::Base
  belongs_to :student, :class_name => 'User'
  belongs_to :institution


end
