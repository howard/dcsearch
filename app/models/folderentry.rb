class Folderentry < ActiveRecord::Base
  has_many :fileeentries
  belongs_to :folderentry
  belongs_to :userentry
  
  acts_as_ferret :fields => ['fullName', 'shortName', 'parentId', 'userId'], :store_class_name => true
end
