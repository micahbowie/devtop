class QuestionsController < ApplicationController

  def new
    @question = Question.new
  end

  def create
    redirect_if_not_logged_in
    @question = Question.new
    @question.lab = params[:lab]
    @question.question_title = params[:question_title]
    @question.question_content = params[:question_content]
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

  def edit
  end

  def update
  end
end
