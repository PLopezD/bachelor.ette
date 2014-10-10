class User < ActiveRecord::Base
  # Remember to create a migration!
  validates :email, uniqueness: true,
    format: { with: /\S{1,}@\S{1,}.\S{2,}/,
    message: "Email must be properly formated and unique."}
  has_many  :future_bachs
  has_many  :hookups
  has_many  :proposals
  include BCrypt
  has_secure_password

end
