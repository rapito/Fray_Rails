class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me

  set_inheritance_column :kind

  validates :first_name,          :presence => true
  #validates :middle_name,         :presence => true
  validates :first_last_name,     :presence => true
  #validates :second_last_name,    :presence => true
  #validates :identification_card, :presence => true #,:format => { :with => /\A( [0-9]{3,} )\Z/i
  #validates :passport,            :presence => true #,:format => { :with => /\A( [0-9]{3,} )\Z/i
  validates :phone_1,             :presence => true, :numericality => true
  validates :phone_2,             :numericality => true
  validates :address_1,           :presence => true
  #validates :address_2,           :presence => true
  validates :nationality,         :presence => true

end



