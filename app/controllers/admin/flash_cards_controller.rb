module Admin
  class FlashCardsController < AdminController
    before_action :set_flash_card, only: %i[destroy edit update].freeze
    layout "admin"

    def new
      @flash_card = FlashCard.new
    end

    def create
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

    def set_flash_card
      @flash_card = FlashCard.find(params[:id])
    end

    def flash_card_params
      params.require(:flash_card).permit(:question, :answer, :flash_card_category_id)
    end
  end
end
