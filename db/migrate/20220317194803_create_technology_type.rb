class CreateTechnologyType < ActiveRecord::Migration[6.1]
  def change
    create_table :technology_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
