require 'mechanize'
module Jekyll
  QIITA_ORGANIZATION_URL = 'https://qiita.com/organizations/yasslab'
  class QiitaItems < Liquid::Tag
    def initialize(tag_name, text, tokens)
      super
      page = Mechanize.new.get(QIITA_ORGANIZATION_URL)
      @items = page.search('dl.op-CounterItem:nth-child(1) > dd:nth-child(2)').first.children.text.strip.to_i
    end

    def render(_text)
      "#{@items}"
    end
  end

  class QiitaLikes < Liquid::Tag
    def initialize(tag_name, text, tokens)
      super
      page = Mechanize.new.get(QIITA_ORGANIZATION_URL)
      @likes = page.search('dl.op-CounterItem:nth-child(3) > dd:nth-child(2)').first.children.text.strip.to_i
    end

    def render(_text)
      "#{@likes}"
    end
  end
  Liquid::Template.register_tag('qiita_items',Jekyll::QiitaItems)
  Liquid::Template.register_tag('qiita_likes',Jekyll::QiitaLikes)
end
