class CreatePackages < ActiveRecord::Migration[6.1]
  def change
    create_table :packages do |t|
      t.string :name
      t.text :description
      t.string :link
      t.references :technology

      t.timestamps
    end
  end
end
