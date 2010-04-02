class Fileentry < ActiveRecord::Base
  acts_as_ferret :fields => ['name', 'folderId', 'userId']
end
