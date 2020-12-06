class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :user
  validates :answer_content,      presence: true, length: { maximum: 500 }
  validates :user_id,      presence: true
end
