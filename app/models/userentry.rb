class Userentry < ActiveRecord::Base
  acts_as_ferret :fields => ['name', 'hub', 'cid', 'online']
end
