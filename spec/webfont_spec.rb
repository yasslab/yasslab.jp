require 'spec_helper'

# 日本語の Web フォント（Noto Sans JP）は 800 KB を超え、遅い回線ではカバー写真（LCP）と回線を取り合う。
# 見た目はどの OS でも Noto Sans JP にそろえたいので、外さずにページの読み込み後に読む。
# 届くまでは指定済みの代わりのフォントで表示する（display=swap）
RSpec.describe 'Noto Sans JP web font' do
  root   = File.expand_path('..', __dir__)
  scss   = File.read(File.join(root, 'css/bootstrap/scss/_mystyle.scss'))
  header = File.read(File.join(root, '_includes/header.html'))
  url    = 'https://fonts.googleapis.com/css?family=Noto+Sans+JP:400,700&display=swap'

  it 'is not imported from the stylesheet (it would be fetched along with the LCP image)' do
    expect(scss).not_to include('family=Noto+Sans+JP')
  end

  it 'is loaded after the load event, with display=swap' do
    script = header[%r{<script>[^<]*addEventListener\('load'.*?</script>}m]
    expect(script).to include(url)
  end

  it 'is loaded without JavaScript, too' do
    expect(header).to match(%r{<noscript><link rel="stylesheet" href="#{Regexp.escape(url)}"></noscript>})
  end
end
