class HomeController < ApplicationController
    def home
      @projects = Project.all_visible
      @features = Feature.all[0..3]
    end
end
