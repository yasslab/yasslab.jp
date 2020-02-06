module Jekyll
  GITHUB_API_ENDPOINT     = 'https://api.github.com/orgs/yasslab/repos?per_page=100'
  GITHUB_PRESET_REPOS     = 80
  GITHUB_PRESET_STARS     = 580

  class GitHubRepos < Liquid::Tag
    def initialize(tag_name, text, tokens)
      super
      begin
        uri     = URI.parse(GITHUB_API_ENDPOINT)
        json    = Net::HTTP.get(uri)
        stats   = JSON.parse(json)
        @repos  = stats.count
      rescue
        @repos  = 0
      end

      @repos = GITHUB_PRESET_REPOS if @repos.zero?
    end

    def render(_text)
      @repos
    end
  end

  class GitHubStars < Liquid::Tag
    def initialize(tag_name, text, tokens)
      super
      begin
        uri     = URI.parse(GITHUB_API_ENDPOINT)
        json    = Net::HTTP.get(uri)
        stats   = JSON.parse(json)
        @stars  = stats.sum {|h| h['stargazers_count'] }
      rescue
        @stars  = 0
      end

      @stars = GITHUB_PRESET_STARS if @stars.zero?
    end

    def render(_text)
      @stars
    end
  end

  Liquid::Template.register_tag('github_repos', Jekyll::GitHubRepos)
  Liquid::Template.register_tag('github_stars', Jekyll::GitHubStars)
end
