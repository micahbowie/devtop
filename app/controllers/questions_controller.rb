class QuestionsController < ApplicationController
before_action :redirect_if_not_logged_in

  def new
    @question = Question.new
  end

  def create
    @question = Question.new(question_params)
    @question.user_id = User.find_by(:username => session[:username]).id
    if @question.save
      redirect_to @question
    else
      render 'new'
    end
  end

  def show
    @question = Question.find(params[:id])
    @answers = @question.answers
  end


  private

  def question_params
    params.permit(:question_title, :question_content, :lab)
  end
end
