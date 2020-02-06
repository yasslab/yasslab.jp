require 'nokogiri'
module Jekyll
  QIITA_ORGANIZATION_URL = 'https://qiita.com/organizations/yasslab'
  QIITA_PRESET_ITEMS     = 150
  QIITA_PRESET_LIKES     = 7550

  class QiitaStats < Liquid::Tag
    def initialize(tag_name, text, tokens)
      super

      begin
        # Don't access to Qiita server unless Production
        if ENV['JEKYLL_ENV'] == 'production'
          page  = Nokogiri::HTML(open QIITA_ORGANIZATION_URL)
        else
          page  = Nokogiri::HTML(File.read '_data/qiita_org_sample.html')
        end
      rescue
        page  = Nokogiri::HTML(File.read '_data/qiita_org_sample.html')
      end

      if text.strip == "items"
        element = page.search('dl.op-CounterItem:nth-child(1) > dd:nth-child(2)').first
        @items = element.children.text.to_i
      elsif text.strip == "likes"
        element = page.search('dl.op-CounterItem:nth-child(3) > dd:nth-child(2)').first
        @items = element.children.text.to_i
      else
        @items = QIITA_PRESET_ITEMS
      end
    end

    def render(_text)
      @items
    end
  end

  Liquid::Template.register_tag('qiita_stats', Jekyll::QiitaStats)
end
