require 'yaml'

describe 'news cover images' do
  let(:news) { YAML.load_file('_data/news.yml') }
  let(:note_articles) { news.select { |n| n['url']&.include?('note.com/yasslab/') } }

  it 'has a cover image file for every note.com article' do
    note_articles.each do |article|
      note_id   = article['url'].split('/').last
      cover_path = "img/news/note-#{note_id}.png"
      expect(File.exist?(cover_path)).to be(true),
        "Missing cover: #{cover_path}  (url: #{article['url']})"
    end
  end
end
