class Result < ApplicationRecord
  belongs_to :user
  belongs_to :quiz
  belongs_to :answer
end
