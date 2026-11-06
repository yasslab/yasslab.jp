require 'net/http'

module Jekyll
  GITHUB_API_ENDPOINT     = 'https://api.github.com/orgs/yasslab/repos'
  GITHUB_PER_PAGE         = 100 # The maximum number of repos the API returns per page
  GITHUB_PRESET_REPOS     = 60
  GITHUB_PRESET_STARS     = 620

  class GitHubStats < Liquid::Tag
    # Fetch all repos page by page, since the API returns at most GITHUB_PER_PAGE repos per page.
    # Returns the error Hash as it is when the API fails (e.g. rate limit).
    def self.fetch_repos
      repos = []
      (1..).each do |page|
        stats = JSON.parse(yield URI("#{GITHUB_API_ENDPOINT}?per_page=#{GITHUB_PER_PAGE}&page=#{page}"))
        return stats unless stats.is_a? Array
        repos.concat(stats)
        return repos if stats.size < GITHUB_PER_PAGE
      end
    end

    def initialize(tag_name, text, tokens)
      super

      begin
        if ENV['JEKYLL_ENV'] == 'production'
          stats   = self.class.fetch_repos { |uri| Net::HTTP.get(uri) }
        else
          # Don't call GitHub API unless Production
          stats   = JSON.parse(File.read('_data/github_stats_sample.json'))
        end
      rescue
        stats = {
          "message" => "API rate limit exceeded for xxx.xxx.xxx.xxx. (But here's the good news: Authenticated requests get a higher rate limit. Check out the documentation for more details.)",
          "documentation_url"=>"https://developer.github.com/v3/#rate-limiting"
        }
      end

      # Success: Array of Hashes of GitHub repos
      # Failure: Hash (See example API limit above)
      if stats.is_a? Array
        repos  = stats.count
        stars  = stats.sum{|h| h['stargazers_count']}
      else
        repos  = GITHUB_PRESET_REPOS
        stars  = GITHUB_PRESET_STARS
      end

      @result = "Unknown"
      @result = repos if text.strip == "repos"
      @result = stars if text.strip == "stars"
    end

    def render(_text)
      @result
    end
  end

  Liquid::Template.register_tag('github_stats', Jekyll::GitHubStats)
end
