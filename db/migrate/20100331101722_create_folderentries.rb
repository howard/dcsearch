class CreateFolderentries < ActiveRecord::Migration
  def self.up
    create_table :folderentries do |t|
      t.integer :parentId, :length => 20
      t.string :shortName, :length => 150
      t.string :fullName, :length => 750
      t.integer :userId, :length => 20
    end
  end

  def self.down
    drop_table :folderentries
  end
end
