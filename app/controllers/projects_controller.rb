class ProjectsController < ApplicationController
  def show
    # sort by the project
    @project = Project.find(params[:id])
  end
end
