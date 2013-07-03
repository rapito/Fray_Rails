class CreateRecords < ActiveRecord::Migration
  def self.up
    create_table :records do |t|
      t.integer :id
      t.string :comment
      t.string :type

      t.timestamps
    end
  end

  def self.down
    drop_table :records
  end
end
