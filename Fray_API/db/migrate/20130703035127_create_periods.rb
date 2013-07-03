class CreatePeriods < ActiveRecord::Migration
  def self.up
    create_table :periods do |t|
      t.integer :id
      t.date :init_date
      t.date :end_date
      t.string :type

      t.timestamps
    end
  end

  def self.down
    drop_table :periods
  end
end
