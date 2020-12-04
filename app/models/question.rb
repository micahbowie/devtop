class Question < ApplicationRecord
  belongs_to :user
  has_many :answers
  validates :question_content,      presence: true
  validates :question_title,      presence: true

  def self.search(search_term)
    if search_term
      where(["lab LIKE ?", "%#{search_term}%"])
    else
      all
    end
  end

end
