class AddBodyToFeature < ActiveRecord::Migration[6.1]
  def change
    add_column :features, :body, :text
  end
end
