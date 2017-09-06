class QuizzesController < ApplicationController
  before_action :find_quiz, except: [:index, :new, :create]
  before_action :admin!, except: [:show]

  def index
      @quiz = Quiz.all
  end

  def new
    @quiz = Quiz.new
  end

  def create
    @quiz = Quiz.new(quiz_params)
    @quiz.user_id = current_user.id
    if @quiz.save
      redirect_to @quiz
    else
      render "new"
    end
  end

  def edit
    @quiz
  end

  def update
    @quiz.update(quiz_params)
    if @quiz.save
      redirect_to edit_quiz_path(@quiz)
    else
      render "edit"
    end
  end

  def show
    @quiz
  end

  # def destroy
  #   @quiz.questions
  #   @quiz.delete
  #   redirect_to quiz_path
  # end

  private

  def find_quiz
    @quiz = Quiz.find(params[:id])
  end

  def quiz_params
    params.require(:quiz).permit(:title, :published)
  end

end
