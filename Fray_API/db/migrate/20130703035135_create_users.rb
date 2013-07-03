class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.integer :id
      t.string :type
      t.string :enrollment_code
      t.string :enrollment_outer_code
      t.string :studies
      t.string :salary
      t.string :first_name
      t.string :middle_name
      t.string :first_last_name
      t.string :second_last_name
      t.string :identification_card
      t.string :phone_1
      t.string :phone_2
      t.string :address_1
      t.string :address_2
      t.string :nationality
      t.date :registration_date
      t.date :inactivity_date
      t.boolean :active
      t.string :passport

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
