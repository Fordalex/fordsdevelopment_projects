class TechnologyTypeController < ApplicationController
  def projects
    # TODO Rename action - this shows projects and features.
    @technology = Technology.find_by(name: params[:name])
    @technology_groups = @technology.technology_groups
  end
end
