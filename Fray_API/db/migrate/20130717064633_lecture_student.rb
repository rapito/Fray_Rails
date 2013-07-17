class LectureStudent < ActiveRecord::Migration
  def self.up
    create_table "lectures_students", :id => false, :force => true do |t|
      t.integer "lecture_id", :null => false
      t.integer "student_id", :null => false
    end
  end

  def self.down
  end
end
