require 'open3'

module Jekyll
  class UpdatedAt < Liquid::Tag
    def initialize(tag_name, text, tokens)
      super
      @file_path = text.strip
    end

    def render(_context)
      return '' if @file_path.empty?

      stdout, _stderr, _status = Open3.capture2(
        'git', 'log', '--format=%ai', '-1', '--', @file_path
      )
      timestamp = stdout.strip
      return '' if timestamp.empty?

      time = Time.parse(timestamp)
      time.strftime('%Y/%m/%d')
    end
  end

  Liquid::Template.register_tag('updated_at', Jekyll::UpdatedAt)
end
