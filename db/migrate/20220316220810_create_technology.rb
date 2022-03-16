class CreateTechnology < ActiveRecord::Migration[6.1]
  def change
    create_table :technologies do |t|
      t.string :name
      t.string :icon
      t.references :project

      t.timestamps
    end
  end
end
