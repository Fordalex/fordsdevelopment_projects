class CreateFlashCards < ActiveRecord::Migration[6.1]
  def change
    create_table :flash_cards do |t|
      t.integer :correct
      t.integer :incorrect
      t.text :question
      t.text :answer
      t.references :flash_card_category

      t.timestamps
    end
  end
end
