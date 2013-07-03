class User < ActiveRecord::Base

  #Un profesor da varias clases
  has_many :lectures
  #Un profesor puede dar varias materias
  has_and_belongs_to_many :subjects
  #Un profesor es encargado de una sección
  has_one :group

  #Un estudiante tiene varios records historicos
  has_many :records
  #un estudiante tiene varias notas
  has_many :grades
  #un estudiante tiene muchas clases
  has_and_belongs_to_many :lectures
end
