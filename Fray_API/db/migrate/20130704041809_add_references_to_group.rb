class AddReferencesToGroup < ActiveRecord::Migration
  def self.up
    add_column :groups, :period_id, :integer
    add_column :groups, :teacher_id, :integer
    add_column :groups, :stage_id, :integer
  end

  def self.down
    remove_column :groups, :stage_id
    remove_column :groups, :teacher_id
    remove_column :groups, :period_id
  end
end
