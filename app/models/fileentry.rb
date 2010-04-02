class Fileentry < ActiveRecord::Base
  acts_as_ferret :fields => {
    :name => {:boost => 2, :store => :compressed},
    :folderId => {},
    :userId => {:boost => 1.5}
  }
end
