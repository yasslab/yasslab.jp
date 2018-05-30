require 'mechanize'
module Jekyll
  class QiitaItems < Liquid::Tag
    def initialize(tag_name, text, tokens)
      super
      @items = 0
      page = Mechanize.new.get('https://qiita.com/organizations/yasslab')
      page.search('div.organizationHeader_stats_value').each do |element|
        if element.children.at_css('.fa.fa-file-o')
           @items = element.text.strip.to_i
        end
      end
    end

    def render(_text)
      "#{@items}"
    end
  end

  class QiitaLikes < Liquid::Tag
    def initialize(tag_name, text, tokens)
      super
      @likes = 0
      page = Mechanize.new.get('https://qiita.com/organizations/yasslab')
      page.search('div.organizationHeader_stats_value').each do |element|
        if element.children.at_css('.fa.fa-thumbs-up')
           @likes = element.text.strip.to_i
        end
      end
    end

    def render(_text)
      "#{@likes}"
    end
  end
  Liquid::Template.register_tag('qiita_items',Jekyll::QiitaItems)
  Liquid::Template.register_tag('qiita_likes',Jekyll::QiitaLikes)
end
