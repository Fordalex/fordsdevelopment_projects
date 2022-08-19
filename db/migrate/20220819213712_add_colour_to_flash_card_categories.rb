class AddColourToFlashCardCategories < ActiveRecord::Migration[6.1]
  def change
    add_column :flash_card_categories, :colour, :string, limit: 9
  end
end
