module Quiz
  class FlashCardStatsController < Admin::AdminController
    layout "quiz/layouts/application"

    def stats
      @flash_card_categories = FlashCardCategory.root_categories_ordered_by_score
    end
  end
end
