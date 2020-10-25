class Question < ApplicationRecord
  belongs_to :user
  has_many :answers

  def self.search_by(search_term)
    where("LOWER(lab) Like :search_term",
    search_term: "#{search_term.downcase}")
  end

end
