class Group < ActiveRecord::Base
  belongs_to :period
  belongs_to :teacher, :class_name => 'User'
  belongs_to :stage
  has_many :lectures
  has_many :students, through: :lectures, :class_name => 'User'
end
