class CreateFolderentries < ActiveRecord::Migration
  def self.up
    create_table :folderentries do |t|
      t.bigint(20) :parentId
      t.varchar(150) :shortName
      t.varchar(750) :fullName
      t.bigint(20) :userId

      t.timestamps
    end
  end

  def self.down
    drop_table :folderentries
  end
end
