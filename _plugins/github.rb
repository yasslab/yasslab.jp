module Jekyll
  GITHUB_API_ENDPOINT     = 'https://api.github.com/orgs/yasslab/repos?per_page=100'
  GITHUB_PRESET_REPOS     = 80
  GITHUB_PRESET_STARS     = 580

  class GitHubStats < Liquid::Tag
    def initialize(tag_name, text, tokens)
      super

      begin
        if ENV['JEKYLL_ENV'] == 'production'
          uri     = URI.parse(GITHUB_API_ENDPOINT)
          json    = Net::HTTP.get(uri)
          stats   = JSON.parse(json)
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
