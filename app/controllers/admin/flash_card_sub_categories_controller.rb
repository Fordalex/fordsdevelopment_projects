module Admin
  class FlashCardSubCategoriesController < AdminController
    def new
      @flash_card_sub_category = FlashCardSubCategory.new
    end

    def create
      @flash_card_sub_category = FlashCardSubCategory.new(flash_card_sub_category_params)
      if @flash_card_sub_category.save!
        flash[:success] = "FlashCardSubCategory was successfully created."
      else
        flash[:warning] = "An error occurred, please try again."
      end
      redirect_to admin_root_path
    end

    def destroy
      @flash_card_sub_category.destroy
      redirect_to admin_flash_card_sub_categorys_path
    end

    def edit
    end

    def update
      if @flash_card_sub_category.update(flash_card_sub_category_params)
        flash[:success] = "FlashCardSubCategory was successfully updated."
      else
        flash[:warning] = "An error occurred, please try again."
      end
      redirect_to admin_root_path
    end

    def index
      @flash_card_sub_categories = FlashCardSubCategory.all
    end

    private

    def set_flash_card_sub_category
      @flash_card_sub_category = FlashCardSubCategory.find_by(name: params[:name])
    end

    def flash_card_sub_category_params
      params.require(:flash_card_sub_category).permit(:name, :flash_card_category_id)
    end
  end
end
