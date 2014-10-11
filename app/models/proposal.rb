# Records of users proposing to bachelorette

class Proposal < ActiveRecord::Base
  # Remember to create a migration!
  validates   :sender_id, uniqueness: { message: "Don't be desperate..." }

  belongs_to  :recipient, class_name: "User"
  belongs_to  :sender, class_name: "User"
end
