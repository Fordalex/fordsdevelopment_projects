class ProjectsController < ApplicationController
  def show
    # TODO add attribute to project visible: boolean
    # sort by the project
    @project = Project.find(params[:id])
    #@commits = GithubCommits.new(@project.repo).total_commits
    @commits = 30
  end
end
