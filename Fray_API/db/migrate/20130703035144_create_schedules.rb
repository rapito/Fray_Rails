class CreateSchedules < ActiveRecord::Migration
  def self.up
    create_table :schedules do |t|
      t.integer :id
      t.time :start_time
      t.time :end_time
      t.string :day

      t.timestamps
    end
  end

  def self.down
    drop_table :schedules
  end
end
