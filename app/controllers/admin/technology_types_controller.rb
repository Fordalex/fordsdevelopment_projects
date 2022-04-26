module Admin
  class TechnologyTypesController < AdminController
    before_action :set_technology_type, only: %i[destroy edit update].freeze
    layout "admin"

    def new
      @technology_type = TechnologyType.new
    end

    def create
      @technology_type = TechnologyType.new(technology_type_params)
      if @technology_type.save
        flash[:success] = "TechnologyType was successfully created."
        redirect_to admin_technology_types_path(@technology_type)
      else
        flash[:warning] = "An error occurred, please try again."
        render "new"
      end
    end

    def destroy
      @technology_type.destroy
      redirect_to admin_technology_types_path
    end

    def edit
    end

    def update
      if @technology_type.update(technology_type_params)
        flash[:success] = "TechnologyType was successfully updated."
      else
        flash[:warning] = "An error occurred, please try again."
      end
      redirect_to admin_technology_types_path(@technology_type)
    end

    def index
      @technology_types = TechnologyType.all
    end

    private

    def set_technology_type
      @technology_type = TechnologyType.find(params[:id])
    end

    def technology_type_params
      params.require(:technology_type).permit(:name, :description, :link, :technology_id)
    end
  end
end
