class CreateProject < ActiveRecord::Migration[6.1]
  def change
    create_table :projects do |t|
      t.string :name
      t.string :link
      t.string :image
      t.date :started
      t.text :description
      t.text :ux
      t.text :features_left_to_implement
      t.text :current_features
      t.text :acknowledgements
      t.references :features

      t.timestamps
    end
  end
end
