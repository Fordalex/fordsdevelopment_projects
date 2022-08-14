module Quiz
  class FlashCardCategoriesController < ApplicationController
    def index
      @flash_card_categories = FlashCardCategory.all
    end
  end
end
