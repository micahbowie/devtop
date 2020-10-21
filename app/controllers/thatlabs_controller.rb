class ThatlabsController < ApplicationController

  def index
    redirect_if_not_logged_in
    @questions = Question.all.order("created_at DESC")
  end

  def new
    # @question = Question.new
  end

end
