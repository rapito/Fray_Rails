class Stage < ActiveRecord::Base
  has_many :lectures
  has_many :groups
end
