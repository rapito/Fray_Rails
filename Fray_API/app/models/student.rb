class Student < User

  attr_accessible :studies, :salary, :first_name, :middle_name, :first_last_name, :second_last_name, :identification_card, :phone_1, :phone_2, :address_1, :address_2 ,:nationality, :registration_date, :inactivity_date, :active, :passport


  #Un estudiante tiene varios records historicos
  has_many :records
  #un estudiante tiene varias notas
  has_many :grades
  #un estudiante tiene muchas clases
  has_and_belongs_to_many :lectures

end