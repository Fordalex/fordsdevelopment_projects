class FeaturesController < ApplicationController
  before_action :find_feature, only: %i[show]

  def show
  end

  private

  def find_feature
    @feature = Feature.find_by(name: params[:name])
  end
end
