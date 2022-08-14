class CreateFlashCardCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :flash_card_categories do |t|
      t.string :name

      t.timestamps
    end
  end
end
