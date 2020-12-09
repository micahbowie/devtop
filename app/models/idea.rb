class Idea < ApplicationRecord
  belongs_to :user
  belongs_to :project

  validates :idea_content, presence: true, length: { maximum: 500 }
  validates :project_id, presence: true
  scope :cli_ideas, -> { where(project_id: 5) }
  scope :sinatra_ideas, -> { where(project_id: 4) }
  scope :rails_ideas, -> { where(project_id: 3) }
end
