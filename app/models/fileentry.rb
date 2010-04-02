class Fileentry < ActiveRecord::Base
  acts_as_ferret :fields => {
    :name => {:boost => 2},
    :folderId => {},
    :userId => {:boost => 1.5}
  }
end
