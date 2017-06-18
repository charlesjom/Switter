class User < ApplicationRecord
	has_many :swits, dependent: :destroy
	has_many :comments, dependent: :destroy
	has_many :sweets, dependent: :destroy
	has_many :sours, dependent: :destroy

	validates_presence_of :firstname, :middlename, :lastname, :username, :email, :password
	validates_format_of :firstname, :middlename, :lastname, with: /\A[\w ]+\z/i
	validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create
	validates :email, uniqueness: { case_sensitive: false }
	validates_length_of :username, :password, minimum: 6

	has_secure_password
end