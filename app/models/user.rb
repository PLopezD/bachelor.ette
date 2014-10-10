class User < ActiveRecord::Base
  # Remember to create a migration!
  validates :email, :uniqueness => true

  has_many  :future_bachs
  has_many  :hookups
  has_many  :proposals
end
