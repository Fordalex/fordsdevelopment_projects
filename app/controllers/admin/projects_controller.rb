module Admin
  class ProjectsController < AdminController
    before_action :set_project, only: %i[destroy edit update].freeze
    layout "admin"

    def new
      @project = Project.new
    end

    def create
      @project = Project.new(project_params)
      if @project.save!
        flash[:success] = "Project was successfully created."
      else
        flash[:warning] = "An error occurred, please try again."
      end
      create_technology_groups
      create_package_groups
      redirect_to admin_projects_path(@project)
    end

    def destroy
      @project.destroy
      redirect_to admin_projects_path
    end

    def edit
    end

    def update
      delete_technology_groups
      create_technology_groups
      delete_package_groups
      create_package_groups
      if @project.update(project_params)
        flash[:success] = "Project was successfully updated."
      else
        flash[:warning] = "An error occurred, please try again."
      end
      redirect_to admin_projects_path(@project)
    end

    def index
      @projects = Project.all.order(:order)
    end

    private

    def delete_technology_groups
      @project.technology_groups.destroy_all
    end

    def create_technology_groups
      if params[:technologies]
        params[:technologies].each do |key, value|
          technology = Technology.find_by(name: key)
          TechnologyGroup.create(
            technology_groupable: @project,
            technology: technology
          )
        end
      end
    end

    def delete_package_groups
      @project.package_groups.destroy_all
    end

    def create_package_groups
      if params[:packages]
        params[:packages].each do |key, value|
          package = Package.find(key)
          PackageGroup.create(
            package_groupable: @project,
            package: package
          )
        end
      end
    end

    def set_project
      @project = Project.find_by(name: params[:name])
    end

    def project_params
      params.require(:project).permit(:name, :sub_title, :order, :link, :image, :description, :ux, :theme_colours, :visible)
    end
  end
end
