class ProjectsController < ApplicationController

  def show
    @project =  Project.find(params[:id])
    @ideas =  @project.ideas
  end
  
end
