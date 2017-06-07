class User < ApplicationRecord
	# has_many: swits, dependent: :destroy, foreign_key: :created_by

	EMAIL_REGEX = /\A[\w+\-._]+@[a-z\d\-._]+\.[a-z]+\z/i
	VALID_NAME = /\A[\w ]+\z/i
	validates :username, :presence => true, :length => { :in => 6..20 }
	validates :email, :presence => true, format: { with: EMAIL_REGEX }, uniqueness: { case_sensitive: false }
	validates :firstname, :presence => true, format: { with: VALID_NAME }
	validates :middlename, :presence => true, format: { with: VALID_NAME }
	validates :lastname, :presence => true, format: { with: VALID_NAME }

	has_secure_password
	validates :password, :presence => true, :length => { minimum: 6 }
end
