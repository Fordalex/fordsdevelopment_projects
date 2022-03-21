require 'net/http'
# Move this to be a scheduled job as it's effecting the loading speed.
class GithubCommits
  def initialize(repo)
    @repo = repo
    @page = 1
  end

  attr_reader :repo
  attr_reader :page

  def total_commits
    page_commits
    while page_commits == 100
      @page += 1
      page_commits
    end
    commit_count
  end

  def commit_count
    ((page - 1) * 100) + page_commits
  end

  def page_commits
    JSON.parse(request).count
  end

  def request
    Net::HTTP.get(url)
  end

  private

  def url
    URI "https://api.github.com/repos/Fordalex/#{repo}/commits?per_page=100&page=#{page}"
  end
end
