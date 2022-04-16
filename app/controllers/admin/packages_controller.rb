module Admin
  class PackagesController < AdminController
    before_action :set_package, only: %i[destroy edit update].freeze
    layout "admin"

    def new
      @package = Package.new
    end

    def create
      @package = Package.new(package_params)
      if @package.save
        flash[:success] = "Package was successfully created."
        redirect_to admin_packages_path(@package)
      else
        flash[:warning] = "An error occurred, please try again."
        render "new"
      end
    end

    def destroy
      @package.destroy
      redirect_to admin_packages_path
    end

    def edit
    end

    def update
      if @package.update(package_params)
        flash[:success] = "Package was successfully updated."
      else
        flash[:warning] = "An error occurred, please try again."
      end
      redirect_to admin_packages_path(@package)
    end

    def index
      @packages = Package.all
    end

    private

    def set_package
      @package = Package.find_by(name: params[:name])
    end

    def package_params
      params.require(:package).permit(:name, :description, :link, :technology_id)
    end
  end
end
