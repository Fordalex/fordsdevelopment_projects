class HomeController < ApplicationController
    def home
      @projects = Project.all_visible
    end
end
