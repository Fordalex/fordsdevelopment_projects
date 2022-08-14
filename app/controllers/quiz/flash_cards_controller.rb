module Quiz
  class FlashCardsController < QuizController
    def home
    end

    def index
      @flash_cards = FlashCard.all
    end

    def result_update
      correct_cards = params[:flash_cards_correct].split(",")
      incorrect_cards = params[:flash_cards_incorrect].split(",")

      correct_cards.each do |flash_card_id|
        flash_card = FlashCard.find(flash_card_id)
        flash_card.update_column(:correct, flash_card.correct + 1)
      end

      incorrect_cards.each do |flash_card_id|
        flash_card = FlashCard.find(flash_card_id)
        flash_card.update_column(:incorrect, flash_card.incorrect + 1)
      end

      redirect_to quiz_categories_index_path
    end
  end
end
