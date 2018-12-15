require 'mechanize'
module Jekyll
  class QiitaItems < Liquid::Tag
    def initialize(tag_name, text, tokens)
      super
      page = Mechanize.new.get('https://qiita.com/organizations/yasslab')
      @items = page.search('dl.op-CounterItem:nth-child(1) > dd:nth-child(2)').first.children.text.strip.to_i
    end

    def render(_text)
      "#{@items}"
    end
  end

  class QiitaLikes < Liquid::Tag
    def initialize(tag_name, text, tokens)
      super
      page = Mechanize.new.get('https://qiita.com/organizations/yasslab')
      @likes = page.search('dl.op-CounterItem:nth-child(3) > dd:nth-child(2)').first.children.text.strip.to_i
    end

    def render(_text)
      "#{@likes}"
    end
  end
  Liquid::Template.register_tag('qiita_items',Jekyll::QiitaItems)
  Liquid::Template.register_tag('qiita_likes',Jekyll::QiitaLikes)
end
