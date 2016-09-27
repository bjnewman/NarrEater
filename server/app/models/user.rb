class User < ApplicationRecord
	has_secure_password
	validates_presence_of :user_name, :email, :password_digest
	validates_uniqueness_of :email
  validate :valid_email

  def self.authentication(args)
  	user = User.find_by(email: args[:email])
  	return user if user && user.password = args[:password]
  end

  def valid_email
    if !self.email.include? "@"
      errors.add(:email, "must contain @ symbol to be an email!")
    end
  end
end
