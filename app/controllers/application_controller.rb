class ApplicationController < ActionController::Base
  before_action :set_technologies

  private

  def set_technologies
    @technologies = Technology.all.order(:order)
  end
end
