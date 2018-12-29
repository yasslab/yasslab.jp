require 'mechanize'
module Jekyll
  QIITA_ORGANIZATION_URL = 'https://qiita.com/organizations/yasslab'
  class QiitaItems < Liquid::Tag
    def initialize(tag_name, text, tokens)
      super
      page = Mechanize.new.get(QIITA_ORGANIZATION_URL)
      element = page.search('dl.op-CounterItem:nth-child(1) > dd:nth-child(2)').first
      if element.respond_to? :children
          @items = element.children.text.strip.to_i
      else
          @items = 0
      end
    end

    def render(_text)
      "#{@items}"
    end
  end

  class QiitaLikes < Liquid::Tag
    def initialize(tag_name, text, tokens)
      super
      page = Mechanize.new.get(QIITA_ORGANIZATION_URL)
      element = page.search('dl.op-CounterItem:nth-child(3) > dd:nth-child(2)').first
      if element.respond_to? :children
          @likes = element.children.text.strip.to_i
      else
          @likes = 0
      end
    end

    def render(_text)
      "#{@likes}"
    end
  end
  Liquid::Template.register_tag('qiita_items',Jekyll::QiitaItems)
  Liquid::Template.register_tag('qiita_likes',Jekyll::QiitaLikes)
end
