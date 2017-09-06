class User < ApplicationRecord
  has_secure_password
  has_many :quizzes, through: :results
  has_many :results
  has_many :answers, through: :results
  validates :admin, default: false
  validates :email, presence: true, uniqueness: true
  validates :name, presence: true

  def total_score
     score = (correct_answers.length.to_f/self.results.length.to_f) * 100
     score.to_i
  end

  def wrong_answers
    self.results.select {|result| !result.answer.correct}
  end

  def correct_answers
    self.results.select {|result| result.answer.correct}
  end

  def current_quiz_results(quiz)
    self.results.select {|result| result.quiz_id == quiz}
  end
end
