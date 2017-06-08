class User < ApplicationRecord
	has_many :swits, dependent: :destroy

	validates_presence_of :username, :email, :password, :firstname, :middlename, :lastname

	validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create
	validates_format_of :firstname, :middlename, :lastname, with: /\A[\w ]+\z/i

	validates_length_of :username, :password, minimum: 6
	validates :email, uniqueness: { case_sensitive: false }

	has_secure_password
end