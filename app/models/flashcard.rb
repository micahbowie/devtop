class Flashcard < ApplicationRecord
  belongs_to :user
  validates :front,      presence: true
  validates :back,      presence: true
end
