class AddOnlineToUserentry < ActiveRecord::Migration
  def self.up
    add_column :userentries, :online, :boolean
  end

  def self.down
    remove_column :userentries, :online
  end
end
