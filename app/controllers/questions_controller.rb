class QuestionsController < ApplicationController
  before_action :find_quiz
  before_action :find_question, only: [:edit, :update, :destroy]
  def new
    @question = @quiz.questions.build
    @quiz
  end

  def create
    @question = @quiz.questions.build(question_params)
    if @question.save
      redirect_to edit_quiz_path(@quiz)
    else
      render "new"
    end
  end

  def edit
    @quiz
    @question = Question.find(params[:id])
  end

  def update
    if @question.update(question_params)
      redirect_to edit_quiz_path(@quiz)
    else
      render "edit"
    end
  end

  def destroy
    @question.delete
    redirect_to edit_quiz_path(@quiz)
  end

  private
  def find_question
    @question = Question.find(params[:id])
  end

  def find_quiz
    @quiz = Quiz.find(params[:quiz_id])
  end

  def question_params
    params.require(:question).permit(:query)
  end
end
