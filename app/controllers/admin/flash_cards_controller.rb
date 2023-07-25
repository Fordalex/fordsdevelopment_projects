module Admin
  class FlashCardsController < AdminController
    before_action :set_flash_card, only: %i[destroy edit update].freeze
    layout "admin"

    def new
      @flash_card = FlashCard.new
    end

    def create
      return bulk_create_flash_cards if params[:bulk_upload].present?

      @flash_card = FlashCard.new(flash_card_params)
      if @flash_card.save!
        flash[:success] = "FlashCard was successfully created."
      else
        flash[:warning] = "An error occurred, please try again."
      end
      redirect_to admin_flash_cards_path(@flash_card)
    end

    def destroy
      @flash_card.destroy
      redirect_to admin_flash_cards_path
    end

    def edit
    end

    def update
      if @flash_card.update(flash_card_params)
        flash[:success] = "FlashCard was successfully updated."
      else
        flash[:warning] = "An error occurred, please try again."
      end
      redirect_to admin_flash_cards_path(@flash_card)
    end

    def index
      @flash_cards = FlashCard.all
    end

    private

    def bulk_create_flash_cards
      JSON.parse(params[:bulk_upload]).each do |flash_card|
        FlashCard.create!(
          title: flash_card["title"],
          question: flash_card["question"],
          answer: flash_card["answer"],
          flash_card_category_id: flash_card_params["flash_card_category_id"]
        )
      end

      flash[:success] = "FlashCards were successfully created."
      redirect_to admin_flash_cards_path(@flash_card)
    end

    def set_flash_card
      @flash_card = FlashCard.find(params[:id])
    end

    def flash_card_params
      params.require(:flash_card).permit(:question, :answer, :flash_card_category_id)
    end
  end
end
