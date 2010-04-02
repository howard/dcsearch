class CreateUserentries < ActiveRecord::Migration
  def self.up
    create_table :userentries do |t|
      t.string :cid, :length => 40
      t.time :lastScan
      t.string :hub, :length => 50
      t.string :name, :length => 45
    end
  end

  def self.down
    drop_table :userentries
  end
end
