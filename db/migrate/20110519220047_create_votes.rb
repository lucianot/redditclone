class CreateVotes < ActiveRecord::Migration
  def self.up
    create_table :votes do |t|
      t.integer :value
      t.references :link
      t.references :voter
      t.timestamps
    end
    add_foreign_key(:votes, :voter, :dependent => :delete)
  end

  def self.down
    remove_foreign_key(:votes, :dependent => :delete)
    drop_table :votes
  end
end
