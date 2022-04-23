class ProjectsController < ApplicationController
  def show
    # TODO add attribute to project visible: boolean
    # sort by the project
    @project = Project.find_by(name: params[:name])
    @features = Feature.all
  end
end
