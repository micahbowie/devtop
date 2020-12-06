class ProjectsController < ApplicationController
before_action :redirect_if_not_logged_in

  def show
    @project =  Project.find(params[:id])
    @ideas =  @project.ideas
  end

end
