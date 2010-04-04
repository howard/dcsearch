class Fileentry < ActiveRecord::Base
  belongs_to :userentry
  belongs_to :folderentry
  
  acts_as_ferret :fields => ['name', 'folderId', 'userId', 'fileSize'], :store_class_name => true
end
