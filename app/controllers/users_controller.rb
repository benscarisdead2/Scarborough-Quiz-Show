class UsersController < ApplicationController
  def new
      @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@current_session)
    else
      redirect_to quizzes_path
    end
  end

  def show
    @user = current_user
    @quizzes = Quiz.all
  end

  private

  def find_quiz
    @quiz = Quiz.find(params[:quiz_id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
