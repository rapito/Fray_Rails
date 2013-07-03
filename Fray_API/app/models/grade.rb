class Grade < ActiveRecord::Base
  belongs_to :lecture
  belongs_to :student, :class_name => 'User'
end
