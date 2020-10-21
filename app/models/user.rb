class User < ApplicationRecord
  has_secure_password
  has_many :notes
  has_many :flashcards
  has_many :questions
  validates :username,      presence: true, uniqueness: true
end
