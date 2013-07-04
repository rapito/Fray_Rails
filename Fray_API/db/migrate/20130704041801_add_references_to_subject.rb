class AddReferencesToSubject < ActiveRecord::Migration
  def self.up
    add_column :subjects, :stage_id, :integer
  end

  def self.down
    remove_column :subjects, :stage_id
  end
end
