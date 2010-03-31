class CreateUserentries < ActiveRecord::Migration
  def self.up
    create_table :userentries do |t|
      t.varchar(40) :cid
      t.time :lastScan
      t.varchar(50) :hub
      t.varchar(45) :name

      t.timestamps
    end
  end

  def self.down
    drop_table :userentries
  end
end
