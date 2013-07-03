class CreateInstitutions < ActiveRecord::Migration
  def self.up
    create_table :institutions do |t|
      t.integer :id
      t.string :name
      t.string :address
      t.string :phone
      t.string :country

      t.timestamps
    end
  end

  def self.down
    drop_table :institutions
  end
end
