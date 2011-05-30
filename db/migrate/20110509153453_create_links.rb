class CreateLinks < ActiveRecord::Migration
  def self.up
    create_table :links do |t|
      t.string :title
      t.string :url
      t.integer :points, :default => 0
      t.references :user
      
      t.timestamps
    end
  end

  def self.down
    drop_table :links
  end
end
