class ProjectsController < ApplicationController
  before_action :set_project, only: %i[show]

  def show
    # TODO add attribute to project visible: boolean
    @features = Feature.all
    @technologies_used = @project.technology_names
  end

  def index
    @projects = Project.all.order(:order)
  end

  private

  def set_project
    @project = Project.find_by(name: params[:name])
  end
end
