class Project < ApplicationRecord
  has_many :ideas
  has_many :users, through: :ideas
end
