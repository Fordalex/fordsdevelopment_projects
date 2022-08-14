module Quiz
  class FlashCardCategoriesController < QuizController
    def index
      @flash_card_categories = FlashCardCategory.all
    end

    def play
      @flash_cards = FlashCard.joins(:flash_card_category).where(flash_card_category: { name: params[:flash_card_category_name] })
    end
  end
end
