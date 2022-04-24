class AddAttributesToFeatures < ActiveRecord::Migration[6.1]
  def change
    add_column :features, :link, :string
    add_column :features, :highlighted, :boolean
  end
end
