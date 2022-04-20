class AddVisibleToProjects < ActiveRecord::Migration[6.1]
  def change
    add_column :projects, :visible, :boolean, default: false
  end
end
