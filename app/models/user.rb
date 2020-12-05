class User < ApplicationRecord
  has_secure_password
  has_many :notes
  has_many :flashcards
  has_many :questions
  has_many :answers
  has_many :ideas
  has_many :projects, through: :ideas
  validates :username,      presence: true, uniqueness: true
end
