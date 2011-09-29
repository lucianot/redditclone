class CreateLinks < ActiveRecord::Migration
  def self.up
    create_table :links do |t|
      t.string :title
      t.string :url
      t.integer :points, :default => 0
      t.references :submitter
      t.timestamps
    end
    add_foreign_key(:links, :users, :column => 'submitter_id')
  end

  def self.down
    remove_foreign_key(:links, :users)
    drop_table :links
  end
end
