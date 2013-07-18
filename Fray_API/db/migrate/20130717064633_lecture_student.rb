class LectureStudent < ActiveRecord::Migration
  def self.up
    create_table "lectures_students", :id => false, :force => true do |t|
      t.integer "lecture_id", :null => false,references: [:Lecture, :id]
      t.integer "student_id", :null => false,references: [:Student, :id]
    end
    execute "ALTER TABLE lectures_students ADD PRIMARY KEY (lecture_id,student_id);"
  end

  def self.down
  end
end
