class AddIndexToVotes < ActiveRecord::Migration
  def self.up
    add_index :votes, [ :link_id, :user_id ], :unique => true
  end

  def self.down
    remove_index :votes, [ :link_id, :user_id ], :unique => true
  end
end
