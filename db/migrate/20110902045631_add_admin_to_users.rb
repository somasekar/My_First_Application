class AddAdminToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :admin, :boolean
  end

  def self.down
    remove_column :users, :admin, :default => false
  end
end
