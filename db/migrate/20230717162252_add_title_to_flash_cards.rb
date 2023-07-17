class AddTitleToFlashCards < ActiveRecord::Migration[6.1]
  def change
    add_column :flash_cards, :title, :string
  end
end
