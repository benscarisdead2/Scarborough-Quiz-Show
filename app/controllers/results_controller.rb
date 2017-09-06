class ResultsController < ApplicationController
  before_action :find_quiz

  def create
    @result = Result.new(user_id: current_user.id, quiz_id: params[:result][:quiz_id] , answer_id: params[:result][:answer_id])

    if @result.save
      redirect_to @quiz
    else
      redirect_to @quiz
    end
  end

  private

  def find_quiz
    @quiz = Quiz.find(params[:result][:quiz_id])
  end

end
