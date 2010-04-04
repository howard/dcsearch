class Userentry < ActiveRecord::Base
  acts_as_ferret :fields => ['name', 'hub', 'cid', 'online'], :store_class_name => true
end
