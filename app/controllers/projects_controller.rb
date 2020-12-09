class ProjectsController < ApplicationController
before_action :redirect_if_not_logged_in
layout "idea-layout"

  def show
    @project =  Project.find(params[:id])
    @ideas =  @project.ideas
  end

end
