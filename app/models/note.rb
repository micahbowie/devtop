class Note < ApplicationRecord
  belongs_to :users
  validates :title,      presence: true
  validates :content,      presence: true
end
