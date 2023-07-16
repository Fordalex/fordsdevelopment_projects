class CreateFlashCardSubCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :flash_card_sub_categories do |t|
      t.string :name

      t.timestamps
    end
  end
end
