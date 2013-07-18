class SubjtectTeacher < ActiveRecord::Migration
  def self.up
    create_table "subjects_teachers", :id => false, :force => true do |t|
      t.integer "subject_id", :null => false,references: [:Subject, :id]
      t.integer "teacher_id", :null => false,references: [:Teacher, :id]
    end
    execute "ALTER TABLE subjects_teachers ADD PRIMARY KEY (subject_id,teacher_id);"
  end

  def self.down
  end
end
