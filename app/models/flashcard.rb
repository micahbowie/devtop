class Flashcard < ApplicationRecord
  belongs_to :user
  validates :front,      presence: true, length: { maximum: 500 }
  validates :back,      presence: true, length: { maximum: 500 }
end
