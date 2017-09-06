class Answer < ApplicationRecord
  belongs_to :question
  has_many :results
  validates :text, presence: true
end
