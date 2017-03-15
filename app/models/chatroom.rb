class Chatroom < ApplicationRecord
	has_many :messages, through: :users
	has_many :users, dependent: :destroy
	validates :topic, presence: true, uniqueness: true
end
