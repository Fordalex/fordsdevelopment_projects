module Admin
  class FeaturesController < AdminController
    before_action :set_feature, only: %i[destroy edit update].freeze
    layout "admin"

    def new
      @feature = Feature.new
    end

    def create
      @feature = Feature.new(feature_params)
      if @feature.save!
        flash[:success] = "Feature was successfully created."
      else
        flash[:warning] = "An error occurred, please try again."
      end
      create_technology_groups
      redirect_to admin_features_path(@feature)
    end

    def destroy
      @feature.destroy
      redirect_to admin_features_path
    end

    def edit
    end

    def update
      delete_technology_groups
      create_technology_groups
      if @feature.update(feature_params)
        flash[:success] = "Feature was successfully updated."
      else
        flash[:warning] = "An error occurred, please try again."
      end
      redirect_to admin_features_path(@feature)
    end

    def index
      @features = Feature.all
    end

    private

    def delete_technology_groups
      @feature.technology_groups.destroy_all
    end

    def create_technology_groups
      params[:technologies].each do |key, value|
        technology = Technology.find_by(name: key)
        TechnologyGroup.create(
          technology_groupable: @feature,
          technology: technology
        )
      end
    end

    def set_feature
      @feature = Feature.find_by(name: params[:name])
    end

    def feature_params
      params.require(:feature).permit(:name, :description, :project_id, :completed, :body)
    end
  end
end
