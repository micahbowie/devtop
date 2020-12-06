class User < ApplicationRecord
  has_secure_password
  has_many :notes, dependent: :destroy
  has_many :flashcards, dependent: :destroy
  has_many :questions
  has_many :answers
  has_many :ideas, dependent: :destroy
  has_many :projects, through: :ideas
  validates :username, presence: true, uniqueness: true,
      :format => {
      with: /[a-zA-Z0-9]+\z/ , 
      :message => 'no special characters, only letters and numbers'
      }
  validates_length_of :username, minimum: 5, maximum: 12, allow_blank: false
end
