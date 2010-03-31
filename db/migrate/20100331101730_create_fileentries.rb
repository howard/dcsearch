class CreateFileentries < ActiveRecord::Migration
  def self.up
    create_table :fileentries do |t|
      t.varchar(200) :name
      t.varchar(40) :hash
      t.bigint(20) :folderId
      t.bigint(20) :userId
      t.bigint(20) :fileSize

      t.timestamps
    end
  end

  def self.down
    drop_table :fileentries
  end
end
