module Admin
  class TechnologiesController < AdminController
    before_action :set_technology, only: %i[destroy edit update].freeze
    layout "admin"

    def new
      @technology = Technology.new
    end

    def create
      @technology = Technology.new(technology_params)
      if @technology.save!
        flash[:success] = "Technology was successfully created."
      else
        flash[:warning] = "An error occurred, please try again."
      end
      redirect_to admin_technologies_path(@technology)
    end

    def destroy
      @technology.destroy
      redirect_to admin_technologys_path
    end

    def edit
    end

    def update
      if @technology.update(technology_params)
        flash[:success] = "Technology was successfully updated."
      else
        flash[:warning] = "An error occurred, please try again."
      end
      redirect_to admin_technologies_path(@technology)
    end

    def index
      @technologys = Technology.all
    end

    private

    def set_technology
      @technology = Technology.find(params[:id])
    end

    def technology_params
      params.require(:technology).permit(:name, :icon, :icon_high_res, :technology_type_id)
    end
  end
end
