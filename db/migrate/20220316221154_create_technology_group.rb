class CreateTechnologyGroup < ActiveRecord::Migration[6.1]
  def change
    create_table :technology_groups do |t|
      t.references :technology
      t.references :project

      t.timestamps
    end
  end
end
