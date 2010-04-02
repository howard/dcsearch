class RenameHashColumns < ActiveRecord::Migration
  def self.up
    # Necessary because ActiveRecord::hash exists
    rename_column 'fileentries', 'hash', 'hashCode'
  end

  def self.down
    rename_column 'fileentries', 'hashCode', 'hash'
  end
end
