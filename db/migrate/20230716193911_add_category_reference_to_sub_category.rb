class AddCategoryReferenceToSubCategory < ActiveRecord::Migration[6.1]
  def change
    add_reference :flash_card_sub_categories, :flash_card_category, null: true, foreign_key: true
  end
end
