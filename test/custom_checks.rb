# See the following 'Custom Tests' section to add tests ;)
# https://github.com/gjtorikian/html-proofer#custom-tests

class QiitaTeam < ::HTMLProofer::Check
  # Links to Qiita:Team should be failed due to access limitations

  def run
    @html.css('a').each do |node|
      link = create_element(node)
      next if link.ignore?

      if link.href.match? /yasslab\.qiita\.com/
        return add_failure("Links to Qiita:Team does NOT work for visitors.", line: link.line)
      end
    end
  end
end

class TrailingSlash < ::HTMLProofer::Check
  # Internal links with trailing slash before anchor may return 404 in production (Rack::TryStatic)
  # Example: /ja/docs/work-regulations/#4-勤務 (bad) vs /ja/docs/work-regulations#4-勤務 (good)

  def run
    @html.css('a').each do |node|
      link = create_element(node)
      next if link.ignore?
      next if link.href.nil?

      # 内部リンクのみチェック（\A で文字列先頭のみマッチ - セキュア）
      next unless link.href.match?(/\A\//)

      # アンカーを含むリンクのみチェック
      next unless link.href.include?('#')

      # アンカーより前の部分を取得
      base_path = link.href.split('#').first

      # trailing slash で終わり、2階層以上のパスの場合のみチェック（\z で文字列末尾のみマッチ - セキュア）
      # /ja/ や /en/ のような1階層ディレクトリは除外（これらは問題ない）
      # /ja/docs/work-regulations/ のような2階層以上は検出（.htmlファイルへのtrailing slashは404の可能性）
      if base_path.match?(/\/\z/) && base_path != '/' && base_path.count('/') > 2
        return add_failure("Internal link has trailing slash before anchor: #{link.href} (Rack::TryStatic may return 404 in production)", line: link.line)
      end
    end
  end
end
