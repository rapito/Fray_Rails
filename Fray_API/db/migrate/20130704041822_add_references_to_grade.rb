class AddReferencesToGrade < ActiveRecord::Migration
  def self.up
    add_column :grades, :lecture_id, :integer
    add_column :grades, :student_id, :integer
  end

  def self.down
    remove_column :grades, :student_id
    remove_column :grades, :lecture_id
  end
end
