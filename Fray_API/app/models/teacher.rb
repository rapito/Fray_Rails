class Teacher < User

  attr_accessible :type, :first_name, :middle_name, :first_last_name, :second_last_name, :identification_card, :phone_1, :phone_2, :address_1, :address_2 ,:nationality, :registration_date, :inactivity_date, :active, :passport

  #Un profesor da varias clases
  has_many :lectures
  #Un profesor puede dar varias materias
  has_and_belongs_to_many :subjects ,:autosave => true
  #Un profesor es encargado de una sección
  has_one :group

end