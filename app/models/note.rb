class Note < ApplicationRecord
  belongs_to :user
  validates :title,      presence: true, length: { maximum: 20 }
  validates :content,      presence: true, length: { maximum: 500 }

end
