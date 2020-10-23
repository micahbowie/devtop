class ThatlabsController < ApplicationController

  def index
    redirect_if_not_logged_in
    @questions = Question.all.order("created_at DESC")
  end

  def new_question
    @question = Question.new
  end

  def create_question
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

  def create_answer
    redirect_if_not_logged_in
    @the_question = Question.find_by(:id => params[:id])
    @answer = Answer.new
    @answer.lab = @the_question.lab
    @answer.answer_content = params[:answer_content]
    @answer.question_id = @the_question.id
    @answer.user_id = User.find_by(:username => session[:username]).id
    if @answer.save
      redirect_to "/questions/#{@the_question.id}"
    else
      render 'question_show'
    end
  end

  def question_show
    @question = Question.find(params[:id])
    # @answers = @question.answers
  end

  private

  def current_question
    Question.find_by(:id => params[:id])
    # Question.find(params[:id])
  end
end
