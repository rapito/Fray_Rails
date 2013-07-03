class CreateGroups < ActiveRecord::Migration
  def self.up
    create_table :groups do |t|
      t.integer :id
      t.string :name
      t.string :suffix

      t.timestamps
    end
  end

  def self.down
    drop_table :groups
  end
end
