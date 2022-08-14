class AddDefaultToFlashCardsCorrect < ActiveRecord::Migration[6.1]
  def change
    change_column :flash_cards, :correct, :integer, default: 0
    change_column :flash_cards, :incorrect, :integer, default: 0
  end
end
