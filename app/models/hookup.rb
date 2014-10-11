class Hookup < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to  :recipient, class_name: "User"
  belongs_to  :sender, class_name: "User"
end
