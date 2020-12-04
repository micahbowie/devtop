class ThatlabsController < ApplicationController
before_action :redirect_if_not_logged_in

  def index
    @questions = Question.search(params[:search])
  end

  def find
    @questions = Question.search(params[:search])
  end

  def create_answer
    @the_question = Question.find_by(:id => params[:id])
    @answer = Answer.new
    @answer.lab = @the_question.lab
    @answer.answer_content = params[:answer_content]
    @answer.question_id = @the_question.id
    @answer.user_id = User.find_by(:username => session[:username]).id
    if @answer.save
      redirect_to "/questions/#{@the_question.id}", notice: "Your answer has been saved!"
    else
      render 'question_show'
    end
  end

end
