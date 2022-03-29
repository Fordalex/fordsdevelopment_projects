class HomeController < ApplicationController
    def home
      @projects = Project.all.order(:order)
    end
end
