class ProjectsController < ApplicationController
  def index
    # sort by the project
    @projects = Project.all
  end

  def show
  end
end
