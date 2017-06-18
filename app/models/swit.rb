class Swit < ApplicationRecord
	belongs_to :user
	has_many :comments, dependent: :destroy
	has_many :sweets, dependent: :destroy
	has_many :sours, dependent: :destroy

	default_scope -> { order(created_at: :desc) }

	validates_presence_of :user_id, :content
	validates_length_of :content, maximum: 140
end