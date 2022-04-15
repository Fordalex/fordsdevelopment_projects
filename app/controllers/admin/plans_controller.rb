module Admin
  class PlansController < AdminController
    before_action :set_plan, only: %i[destroy edit update].freeze
    layout "admin"

    def new
      @plan = Plan.new
    end

    def create
      @plan = Plan.new(plan_params)
      if @plan.save!
        flash[:success] = "Plan was successfully created."
      else
        flash[:warning] = "An error occurred, please try again."
      end
      redirect_to admin_plans_path(@plan)
    end

    def destroy
      @plan.destroy
      redirect_to admin_plans_path
    end

    def edit
    end

    def update
      if @plan.update(plan_params)
        flash[:success] = "Plan was successfully updated."
      else
        flash[:warning] = "An error occurred, please try again."
      end
      redirect_to admin_plans_path(@plan)
    end

    def index
      @plans = Plan.all
    end

    private

    def set_plan
      @plan = Plan.find(params[:id])
    end

    def plan_params
      params.require(:plan).permit(:name, :description, :project_id)
    end
  end
end
