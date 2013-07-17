class SubjtectTeacher < ActiveRecord::Migration
  def self.up
    create_table "subjects_teachers", :id => false, :force => true do |t|
      t.integer "subject_id", :null => false
      t.integer "teacher_id", :null => false
    end
  end

  def self.down
  end
end
