# Successful pairing where bachelorette
# accepts proposal

class User < ActiveRecord::Base
  # Remember to create a migration!

  validates :email, uniqueness: true,
    format: { with: /\S{1,}@\S{1,}.\S{2,}/,
    message: "Email must be properly formated and unique." }

  # Tells user to give a URL to a gif.
  # validates :picture, presence: { message: "Add a photo" }

  has_many  :future_bachelorettes
  has_many  :hookups
  has_many  :proposals
  has_many  :recipients, through: :proposals
  has_many  :senders, through: :proposals
  include BCrypt
  has_secure_password

end
