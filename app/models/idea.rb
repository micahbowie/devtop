class Idea < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :project
end