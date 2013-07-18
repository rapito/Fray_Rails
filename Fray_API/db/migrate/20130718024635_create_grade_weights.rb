class CreateGradeWeights < ActiveRecord::Migration
  def self.up
    create_table :grade_weights do |t|
      t.integer :id, :auto_increment => true
      t.integer :grade_id,:unique => :true
      t.integer :weight

      t.timestamps
    end
    execute "ALTER TABLE grade_weights ADD CONSTRAINT unique_grade_id UNIQUE (grade_id);"
  end

  def self.down
    drop_table :grade_weights
  end
end
