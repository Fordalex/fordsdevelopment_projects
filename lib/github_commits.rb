require 'net/http'
# Move this to be a scheduled job as it's effecting the loading speed.
class GithubCommits
  def initialize(repo)
    @repo = repo
  end

  def total_commits
    response = `curl -I -k "#{@repo}?per_page=1" | sed '/^[Ll]ink:/ s/.*"next".*page=\([0-9]*\).*"last".*/\1/p'`
    response.split('>; rel="last"').first[-5..-1].delete("^0-9")
  end
end
