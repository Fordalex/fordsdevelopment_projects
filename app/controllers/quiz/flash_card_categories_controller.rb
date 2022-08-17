module Quiz
  class FlashCardCategoriesController < QuizController
    def index
      @flash_card_categories = FlashCardCategory.all
    end

    def play
      category_ids = []
      params[:categories].each { |k,v| v === "1" ? category_ids << k : next }
      @flash_cards = FlashCard.where(flash_card_category_id: category_ids)
      # TODO don't render from a post request
      render 'play'
    end
  end
end
