class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
    def current_user
      @current_user ||= User.find_by id: session[:user_id]
    end

  def authorize
    unless current_user
      redirect_to new_session_path
    end
  end

  def find_quiz
    @quiz = Quiz.find(params[:quiz_id])
  end

  def find_question
    @question = Question.find(params[:question_id])
  end

  def find_answer
    @answer = Answer.find(params[:id])
  end

  def admin!
    unless current_user.admin
      redirect_to new_session_path
    end
  end
end
