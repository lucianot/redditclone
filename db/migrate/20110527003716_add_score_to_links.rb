class AddScoreToLinks < ActiveRecord::Migration
  def self.up
    add_column :links, :points, :integer, :default => 0
  end

  def self.down
    remove_column :links, :points
  end
end
