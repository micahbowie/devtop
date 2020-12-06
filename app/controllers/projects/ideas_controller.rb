class Projects::IdeasController < ApplicationController

  def create
    @idea = Idea.new(idea_params)
    @idea.user_id = current_user.id
    byebug
    if @idea.save
      redirect_to :project
    else
      render 'new'
    end
  end

  def new
    @idea = Idea.new
  end
end

private

  def idea_params
    params.permit(:idea_content, :project_id)
  end