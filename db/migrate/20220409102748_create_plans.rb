class CreatePlans < ActiveRecord::Migration[6.1]
  def change
    create_table :plans do |t|
      t.string :title
      t.text :description
      t.references :project

      t.timestamps
    end
  end
end
