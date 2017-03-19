class Chatroom < ApplicationRecord
	has_many :messages, dependent: :destroy
  has_many :users, through: :messages
  
	validates :topic, presence: true, uniqueness: true
	has_and_belongs_to_many :users
end
