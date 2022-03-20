module Admin
  class ProjectsController < AdminController
    before_action :set_profile, only: %i[destroy edit update].freeze
    layout "admin"

    def destroy
      @project.destroy
      redirect_to admin_projects_path
    end

    def edit
    end

    def update
      create_technology_groups
      if @project.update(profile_params)
        flash[:success] = "Project was successfully updated."
      else
        flash[:warning] = "An error occurred, please try again."
      end
      redirect_to admin_projects_path(@project)
    end

    def index
      @projects = Project.all
    end

    private

    def create_technology_groups
      @project.technology_groups.destroy_all
      params[:technologies].each do |key, value|
        technology = Technology.find_by(name: key)
        TechnologyGroup.create(
          technology_groupable: @project,
          technology: technology
        )
      end
    end

    def set_profile
      @project = Project.find(params[:id])
    end

    def profile_params
      params.require(:project).permit(:name)
    end
  end
end
