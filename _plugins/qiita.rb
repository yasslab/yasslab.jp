require 'mechanize'

module Jekyll
  QIITA_ORGANIZATION_URL = 'https://qiita.com/organizations/yasslab'
  QIITA_PRESET_ITEMS     = 150
  QIITA_PRESET_LIKES     = 7500

  class QiitaItems < Liquid::Tag
    def initialize(tag_name, text, tokens)
      super
      begin
        page    = Mechanize.new.get(QIITA_ORGANIZATION_URL)
        element = page.search('dl.op-CounterItem:nth-child(1) > dd:nth-child(2)').first
      rescue
        element = 0
      end
      if element.respond_to? :children
        @items = element.children.text.strip.to_i
      else
        @items = QIITA_PRESET_ITEMS
      end
    end

    def render(_text)
      @items
    end
  end

  class QiitaLikes < Liquid::Tag
    def initialize(tag_name, text, tokens)
      super
      begin
        page    = Mechanize.new.get(QIITA_ORGANIZATION_URL)
        element = page.search('dl.op-CounterItem:nth-child(3) > dd:nth-child(2)').first
      rescue
        element = 0
      end

      if element.respond_to? :children
        @likes = element.children.text.strip.to_i
      else
        @likes = QIITA_PRESET_LIKES
      end
    end

    def render(_text)
      @likes
    end
  end

  Liquid::Template.register_tag('qiita_items', Jekyll::QiitaItems)
  Liquid::Template.register_tag('qiita_likes', Jekyll::QiitaLikes)
end
