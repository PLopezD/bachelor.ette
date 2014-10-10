class User < ActiveRecord::Base
  # Remember to create a migration!
  validates :email, uniqueness: true,
    format: { with: /\S{1,}@\S{1,}.\S{2,}/,
    message: "Email must be properly formated and unique."}
  has_many  :future_bachs
  has_many  :hookups
  has_many  :proposals


  include BCrypt

  def self.authenticate(email, given_password)
    user = User.find_by(email: email)
    user.password == given_password ? user : nil
  end

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end


end
