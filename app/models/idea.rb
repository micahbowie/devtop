class Idea < ApplicationRecord
  belongs_to :user
  belongs_to :project

  validates :idea_content, presence: true, length: { maximum: 500 }
end
