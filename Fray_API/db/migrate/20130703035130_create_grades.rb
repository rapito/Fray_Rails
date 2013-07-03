class CreateGrades < ActiveRecord::Migration
  def self.up
    create_table :grades do |t|
      t.integer :id
      t.string :comment
      t.integer :value

      t.timestamps
    end
  end

  def self.down
    drop_table :grades
  end
end
