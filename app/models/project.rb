class Project < ApplicationRecord
  has_many :ideas, dependent: :destroy
  has_many :users, through: :ideas
end
