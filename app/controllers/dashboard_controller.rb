class DashboardController < ApplicationController
  layout "blank_layout"

  def dashboard
    @projects = Project.all
  end
end
