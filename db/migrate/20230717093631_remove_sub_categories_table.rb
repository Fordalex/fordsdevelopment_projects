class RemoveSubCategoriesTable < ActiveRecord::Migration[6.1]
  def change
    remove_reference :flash_cards, :flash_card_sub_category, null: true, foreign_key: true
    drop_table :flash_card_sub_categories
  end
end
