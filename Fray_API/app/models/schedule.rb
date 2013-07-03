class Schedule < ActiveRecord::Base
  #un Horario pertenece a una clase
  has_many :lectures
end
