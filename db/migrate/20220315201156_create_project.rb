class CreateProject < ActiveRecord::Migration[6.1]
  def change
    create_table :projects do |t|
      t.string :name
      t.string :link
      t.string :logo
      t.string :image
      t.string :theme_colours
      t.date :started
      t.text :description
      t.text :ux
      t.integer :order
      # Add acknowledgements as another model
      t.references :features

      t.timestamps
    end
  end
end
