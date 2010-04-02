class CreateFileentries < ActiveRecord::Migration
  def self.up
    create_table :fileentries do |t|
      t.string :name, :length => 200
      t.string :hash, :length => 40
      t.integer :folderId, :length => 20
      t.integer :userId, :length => 20
      t.integer :fileSize, :length => 20
    end
  end

  def self.down
    drop_table :fileentries
  end
end
