class ApplicationController < ActionController::Base
  before_action :set_technologies
  before_action :set_technologies_used

  private

  def set_technologies
    @technologies = Technology.all.order(:order)
  end

  def set_technologies_used
    @technologies_used = []
  end
end
