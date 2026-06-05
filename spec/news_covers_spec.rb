require 'yaml'

describe 'news cover images' do
  let(:news) { YAML.load_file('_data/news.yml') }
  let(:note_articles) { news.select { |n| n['url']&.include?('note.com/yasslab/') } }

  it 'has a cover image file for every note.com article' do
    note_articles.each do |article|
      note_id = article['url'].split('/').last
      covers  = Dir["img/news/note-#{note_id}.*"]
      expect(covers).not_to be_empty,
        "Missing cover image for #{article['url']}"
    end
  end
end
