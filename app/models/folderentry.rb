class Folderentry < ActiveRecord::Base
  acts_as_ferret :fields => ['fullName', 'shortName', 'longName', 'parentId', 'userId']
end
