class Projects::IdeasController < ApplicationController
before_action :redirect_if_not_logged_in
layout "idea-layout"
  def create
    @idea = Idea.new(idea_params)
    @idea.user_id = current_user.id
    if @idea.save
      redirect_to project_path(@idea.project_id)
    else
      flash[:messages] = @idea.errors.full_messages
      redirect_to :new_project_idea
    end
  end

  def new
    @idea = Idea.new
  end

  def index
    @cli_ideas = Idea.cli_ideas
    @sinatra_ideas = Idea.sinatra_ideas
    @rails_ideas = Idea.rails_ideas
  end

  def show
    @idea = Idea.find(params[:id])
  end


private

  def idea_params
    params.permit(:idea_content, :project_id)
  end

end
