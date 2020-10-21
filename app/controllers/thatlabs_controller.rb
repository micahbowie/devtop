class ThatlabsController < ApplicationController

  def index
    redirect_if_not_logged_in
    @questions = Question.all.order("created_at DESC")
  end

  def new_question
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
      redirect_to '/questions/:id'
    else
      render 'new'
    end
  end

  def question_show
    @question = Question.find(params[:id])
  end

end
