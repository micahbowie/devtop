class Projects::IdeasController < ApplicationController
before_action :redirect_if_not_logged_in
  def create
    @idea = Idea.new(idea_params)
    @idea.user_id = current_user.id
    if @idea.save
      redirect_to project_path(@idea.project_id)
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
