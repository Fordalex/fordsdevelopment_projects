class AddCommitsToProjects < ActiveRecord::Migration[6.1]
  def change
    add_column :projects, :github_commits_link, :string
    add_column :projects, :commits, :integer
  end
end
