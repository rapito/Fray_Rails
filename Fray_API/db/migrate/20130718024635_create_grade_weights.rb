class CreateGradeWeights < ActiveRecord::Migration
  def self.up
    create_table :grade_weights do |t|
      t.integer :id, :auto_increment => true
      t.integer :lecture_id#,:unique => :true
      t.decimal :weight
      t.string :comment

      t.timestamps
    end
    #execute "ALTER TABLE grade_weights ADD CONSTRAINT unique_lecture_id UNIQUE (lecture_id);"
  end

  def self.down
    drop_table :grade_weights
  end
end
