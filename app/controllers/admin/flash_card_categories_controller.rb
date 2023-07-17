module Admin
  class FlashCardCategoriesController < AdminController
    before_action :set_flash_card_category, only: %i[destroy edit update].freeze

    def new
      @flash_card_category = FlashCardCategory.new
    end

    def create
      @flash_card_category = FlashCardCategory.new(flash_card_category_params)
      if @flash_card_category.save!
        flash[:success] = "FlashCardCategory was successfully created."
      else
        flash[:warning] = "An error occurred, please try again."
      end
      redirect_to admin_root_path
    end

    def destroy
      @flash_card_category.destroy
      redirect_to admin_flash_card_categorys_path
    end

    def edit
    end

    def update
      if @flash_card_category.update(flash_card_category_params)
        flash[:success] = "FlashCardCategory was successfully updated."
      else
        flash[:warning] = "An error occurred, please try again."
      end
      redirect_to admin_root_path
    end

    def index
      @flash_card_categories = FlashCardCategory.roots
    end

    private

    def set_flash_card_category
      @flash_card_category = FlashCardCategory.find_by(name: params[:name])
    end

    def flash_card_category_params
      params.require(:flash_card_category).permit(:name, :colour, :parent_id)
    end
  end
end
