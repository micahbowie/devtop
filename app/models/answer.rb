class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :user
  validates :answer_content,      presence: true
  validates :user_id,      presence: true
end
