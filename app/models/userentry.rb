class Userentry < ActiveRecord::Base
  acts_as_ferret :fields => ['name', 'hub', 'cid', 'online', 'lastScan'], :store_class_name => true
end
