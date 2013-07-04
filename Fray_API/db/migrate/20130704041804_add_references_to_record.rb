class AddReferencesToRecord < ActiveRecord::Migration
  def self.up
    add_column :records, :student_id, :integer
    add_column :records, :institution_id, :integer
  end

  def self.down
    remove_column :records, :institution_id
    remove_column :records, :student_id
  end
end
