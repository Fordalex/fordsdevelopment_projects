class ChangeCategoryToSubCategoryForFlashCards < ActiveRecord::Migration[6.1]
  def change
    remove_reference :flash_cards, :flash_card_category
    add_reference :flash_cards, :flash_card_sub_category, null: true, foreign_key: true
  end
end
