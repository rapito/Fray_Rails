class CreateLectures < ActiveRecord::Migration
  def self.up
    create_table :lectures do |t|
      t.integer :id

      t.timestamps
    end
  end

  def self.down
    drop_table :lectures
  end
end
