class TechnologyController < ApplicationController
  def show
    @technology = Technology.find_by(name: params[:name])
  end
end
