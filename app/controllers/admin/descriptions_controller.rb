module Admin
  class DescriptionsController < AdminController
    before_action :set_description, only: %i[destroy edit update].freeze
    layout "admin"

    def new
      @description = Description.new
    end

    def create
      @description = Description.new(description_params)
      if @description.save!
        flash[:success] = "Description was successfully created."
      else
        flash[:warning] = "An error occurred, please try again."
      end
      redirect_to admin_descriptions_path(@description)
    end

    def destroy
      @description.destroy
      redirect_to admin_descriptions_path
    end

    def edit
    end

    def update
      if @description.update(description_params)
        flash[:success] = "Description was successfully updated."
      else
        flash[:warning] = "An error occurred, please try again."
      end
      redirect_to admin_descriptions_path(@description)
    end

    def index
      @descriptions = Description.all
    end

    private

    def set_description
      @description = Description.find(params[:id])
    end

    def description_params
      params.require(:description).permit(:name, :description, :project_id)
    end
  end
end
