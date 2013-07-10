class Subject < ActiveRecord::Base
  belongs_to :stage
  has_many :lectures
  has_and_belongs_to_many :teachers, :class_name => 'Teacher'
end
