class ChangeTitleToName < ActiveRecord::Migration[6.1]
  def change
    remove_column :plans, :title, :string
    add_column :plans, :name, :string
  end
end
