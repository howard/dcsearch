# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100331101730) do

  create_table "fileentries", :force => true do |t|
    t.string  "name"
    t.string  "hash"
    t.integer "folderId"
    t.integer "userId"
    t.integer "fileSize"
  end

  create_table "folderentries", :force => true do |t|
    t.integer "parentId"
    t.string  "shortName"
    t.string  "fullName"
    t.integer "userId"
  end

  create_table "userentries", :force => true do |t|
    t.string "cid"
    t.time   "lastScan"
    t.string "hub"
    t.string "name"
  end

end
