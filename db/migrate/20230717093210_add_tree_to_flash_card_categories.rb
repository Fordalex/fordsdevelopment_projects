class AddTreeToFlashCardCategories < ActiveRecord::Migration[6.1]
  def change
    add_column :flash_card_categories, :parent_id, :integer
    add_index :flash_card_categories, :parent_id
  end
end
