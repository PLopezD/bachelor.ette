class Hookup < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to  :recipients, class_name: "User"
  belongs_to  :senders, class_name: "User"
end
