module Admin
  class AdminController < ApplicationController
    before_action :authenticate_administrator!
    layout "admin"

  end
end
