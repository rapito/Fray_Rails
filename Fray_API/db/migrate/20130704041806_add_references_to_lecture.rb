class AddReferencesToLecture < ActiveRecord::Migration
  def self.up
    add_column :lectures, :group_id, :integer
    add_column :lectures, :schedule_id, :integer
    add_column :lectures, :subject_id, :integer
    add_column :lectures, :teacher_id, :integer
  end

  def self.down
    remove_column :lectures, :teacher_id
    remove_column :lectures, :subject_id
    remove_column :lectures, :schedule_id
    remove_column :lectures, :group_id
  end
end
