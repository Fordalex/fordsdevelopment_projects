class AddSubTitleToProjects < ActiveRecord::Migration[6.1]
  def change
    add_column :projects, :sub_title, :string
  end
end
